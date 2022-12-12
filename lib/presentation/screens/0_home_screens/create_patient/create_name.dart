import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';
import '../../../widgets/buttons/grey_next_button.dart';

class PatientProfileMaking extends StatelessWidget {
  const PatientProfileMaking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lập hồ sơ bệnh nhân'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TextFormCubit(),
          ),
        ],
        child: BlocBuilder<TextFormCubit, String>(
          builder: (context, state) => Column(
            children: [
              SizedBox(height: 20),
              Text(
                ' Điền họ tên bệnh nhân:',
                textScaleFactor: 1.5,
                textAlign: TextAlign.left,
              ),
              Center(
                child: SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Họ và tên',
                      fillColor: Colors.white,
                    ),
                    onChanged: (text) {
                      BlocProvider.of<TextFormCubit>(context).update(text);
                      BlocProvider.of<PatientCreationCubit>(context)
                          .updateName(text);
                    },
                  ),
                ),
              ),
              NextButton(
                notice: 'họ và tên',
              ),
            ],
          ),
        ),
      ),
      //   bottomNavigationBar: bottomNavigator(),
    );
  }
}

class NextButton extends StatelessWidget {
  final String notice;
  const NextButton({
    Key? key,
    required this.notice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<TextFormCubit>(context).state != '')
      return NiceButtons(
          stretch: false,
          onTap: (finish) {
            Navigator.of(context, rootNavigator: true)
                .popAndPushNamed('/profileMakingWeight');
          },
          child: Text('Tiếp tục'));
    else
      return Column(
        children: [
          Text('Bạn cần nhập ${this.notice}.'),
          GreyNextButton(),
        ],
      );
  }
}

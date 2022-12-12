import 'package:bloc_app/logic/cubits/patient_add/patient_add_cubit.dart';
import 'package:bloc_app/logic/cubits/text_form/text_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../widgets/bars/bottom_navitgator_bar.dart';
import '../../../widgets/buttons/grey_next_button.dart';

class PatientProfileMaking extends StatelessWidget {
  const PatientProfileMaking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lập hồ sơ bệnh nhân'),
        actions: [
          BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TextFormCubit(),
          ),
          // BlocProvider(
          //   create: (_) => PatientAddCubit(),
          // ),
        ],
        child: BlocBuilder<TextFormCubit, TextFormState>(
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
                      BlocProvider.of<PatientAddCubit>(context)
                          .updateName(text);
                    },
                  ),
                ),
              ),
              Text(
                  BlocProvider.of<PatientAddCubit>(context).state.patient.name),
              Text(BlocProvider.of<PatientAddCubit>(context).state.patient.id),
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
    if (BlocProvider.of<TextFormCubit>(context).state.text != '')
      return NiceButtons(
          stretch: false,
          onTap: (finish) {
            Navigator.of(context).pushNamed('/profileMakingID');
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

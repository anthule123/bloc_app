import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';
import '../../../widgets/buttons/grey_next_button.dart';
import '../../1_current_patient_screens/patient_main_screen/no_insulin/input_cho.dart';

class PatientProfileMakingWeight extends StatelessWidget {
  const PatientProfileMakingWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lập hồ sơ bệnh nhân'),
        //    automaticallyImplyLeading: false,
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
                ' Điền cân nặng bệnh nhân:',
                textScaleFactor: 1.5,
                textAlign: TextAlign.left,
              ),
              Center(
                child: SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cân nặng',
                      fillColor: Colors.white,
                    ),
                    onChanged: (text) {
                      BlocProvider.of<TextFormCubit>(context).update(text);
                    },
                  ),
                ),
              ),
              Text(
                BlocProvider.of<PatientCreationCubit>(context)
                    .state
                    .profile
                    .name,
              ),
              Text(BlocProvider.of<PatientCreationCubit>(context)
                  .state
                  .profile
                  .id),
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
    if (checkNum(BlocProvider.of<TextFormCubit>(context).state))
      return NiceButtons(
          stretch: false,
          onTap: (finish) {
            double weight = double.parse(
                BlocProvider.of<TextFormCubit>(context).state);
            BlocProvider.of<PatientCreationCubit>(context).updateWeight(weight);
            Navigator.of(context).popAndPushNamed('/profileMakingID');
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

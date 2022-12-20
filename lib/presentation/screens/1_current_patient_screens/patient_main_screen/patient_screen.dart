import 'package:bloc_app/data/models/time_controller.dart/sonde_range.dart';
import 'package:bloc_app/logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import 'package:bloc_app/logic/one_shot_cubits/time_check/time_check_cubit.dart';
import 'package:bloc_app/presentation/screens/1_current_patient_screens/patient_main_screen/patient_status_layer.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/patient.dart';
import '../../../../logic/1_patient_cubits/patient_status/patient_status_cubit.dart';

import '../../../widgets/bars/patient_navigator_bar.dart';
import 'first_ask_ui.dart';
import 'no_insulin/no_insulin_case_representation.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: PatientNavigatorBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DoctorImage(),
            Column(
              children: [
                BlocBuilder<TimeCheckCubit, int>(
                  builder: ((context, state) {
                    if (inSondeRange(DateTime.now()))
                      return Column(
                        children: [
                          Text(DateTime.now().toString()),
                          PatientStatusLayer(),
                        ],
                      );
                    else
                      return Text(waitingMessage(DateTime.now()));
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
      // body: top_navigation_bar_patient(),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

class DoctorImage extends StatelessWidget {
  const DoctorImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              color: Colors.white,
              // width: widthDevideMethod(0.1),
              // height: heightDevideMethod(0.372),
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 200,
                  width: 330,
                  // width: widthDevideMethod(0.7),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/doctor.jpg",
                        height: 200, width: 200, fit: BoxFit.fitHeight),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPatientStatusButton extends StatelessWidget {
  const ResetPatientStatusButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<PatientStatusCubit>().update(PatientStatus.firstAsk);
        },
        icon: Icon(Icons.restart_alt_outlined));
  }
}

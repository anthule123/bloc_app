// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc_app/logic/cubits/text_form/text_form_cubit.dart';
import 'package:bloc_app/logic/no_insulin_cubits/no_insulin_cubit.dart';
import 'package:bloc_app/presentation/screens/current_patient_screens/treatments/guide_insulin.dart';
import 'package:bloc_app/presentation/screens/current_patient_screens/treatments/input_glucose.dart';
import 'package:bloc_app/presentation/widgets/grey_next_button.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../widgets/bars/patient_bar.dart';
import 'treatments/input_cho.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PatientBar(),
      ),

      body: Column(
        children: [
          BlocBuilder<NoInsulinCubit, NoInsulinState>(
            builder: ((context, state) {
              // TODO: implement listener
              return Text(BlocProvider.of<NoInsulinCubit>(context)
                  .state
                  .medicalStatus
                  .toString());
            }),
          ),
          BlocBuilder<NoInsulinCubit, NoInsulinState>(
            builder: ((context, state) {
              if (BlocProvider.of<NoInsulinCubit>(context)
                      .state
                      .medicalStatus ==
                  MedicalStatus.gettingCHO) {
                return inputCHO();
              } else if (BlocProvider.of<NoInsulinCubit>(context)
                      .state
                      .medicalStatus ==
                  MedicalStatus.checkingGlucose) {
                return inputGlucose();
              }
              return GuideInsulin();
              //     .state
              //     .medicalStatus)
              // switch (BlocProvider.of<NoInsulinCubit>(context)
              //     .state
              //     .medicalStatus) {
              //   case MedicalStatus.gettingCHO:
              //     return inputCHO();

              //   case MedicalStatus.checkingGlucose:
              //     // TODO: Handle this case.
              //     return inputGlucose();
              //   case MedicalStatus.guidingInsulin:
              //     // TODO: Handle this case.
              //     return GuideInsulin();
              //   case MedicalStatus.waiting:
              //     return Column();
            }),
          ),
        ],
      ),
      // body: top_navigation_bar_patient(),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

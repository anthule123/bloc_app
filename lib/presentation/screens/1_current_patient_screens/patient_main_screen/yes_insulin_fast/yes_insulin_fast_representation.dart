import 'package:bloc_app/data/models/export.dart';
import 'package:bloc_app/data/models/time_controller.dart/check_time_in_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/1_patient_cubits/patient_status/patient_status_cubit.dart';
import '../../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import 'yes_fast_guide_insulin.dart';
import 'yes_fast_input_cho.dart';
import 'yes_fast_input_glucose.dart';

class YesInsulinFastRepresentation extends StatelessWidget {
  const YesInsulinFastRepresentation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<YesInsulinFastCubit, NoInsulinState>(
          listener: (context, state) {
            if (state.goToNextRegimen) {
              context
                  .read<PatientStatusCubit>()
                  .update(PatientStatus.highInsulin);
            }
          },
          builder: ((context, state) {
            switch (BlocProvider.of<YesInsulinFastCubit>(context)
                .state
                .medicalStatus) {
              case MedicalStatus.gettingCHO:
                return YesInsulinFastInputCHO();

              case MedicalStatus.checkingGlucose:
                // TODO: Handle this case.
                return YesInsulinFastInputGlucose();
              case MedicalStatus.guidingInsulin:
                // TODO: Handle this case.
                return YesInsulinFastGuideInsulin();
              case MedicalStatus.waiting:
                return Column();
            }
          }),
        ),
        BlocBuilder<YesInsulinFastCubit, NoInsulinState>(
            builder: (context, state) {
          return Column(
            children: [
              Text(context.read<YesInsulinFastCubit>().badGlucose.toString()),
              Text(state.goToNextRegimen.toString()),
              Text(state.regimen.toString()),
            ],
          );
        })
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import 'guide_insulin.dart';
import 'input_cho.dart';
import 'input_glucose.dart';

class NoInsulinRepresentation extends StatelessWidget {
  const NoInsulinRepresentation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoInsulinCubit, NoInsulinState>(
      builder: ((context, state) {
        switch (BlocProvider.of<NoInsulinCubit>(context).state.medicalStatus) {
          case MedicalStatus.gettingCHO:
            return inputCHO();

          case MedicalStatus.checkingGlucose:
            // TODO: Handle this case.
            return inputGlucose();
          case MedicalStatus.guidingInsulin:
            // TODO: Handle this case.
            return GuideInsulin();
          case MedicalStatus.waiting:
            return Column();
        }
      }),
    );
  }
}

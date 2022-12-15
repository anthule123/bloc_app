import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/patient.dart';
import '../../../../logic/1_patient_cubits/patient_status/patient_status_cubit.dart';

class FirstAskUI extends StatelessWidget {
  const FirstAskUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Bn có tiêm insulin ko?'),
        TextButton(
          onPressed: () {
            context
                .read<PatientStatusCubit>()
                .update(PatientStatus.yesInsulin);
          },
          child: Text('có'),
        ),
        TextButton(
          onPressed: () {
            context
                .read<PatientStatusCubit>()
                .update(PatientStatus.noInsulin);
          },
          child: Text('không'),
        ),
      ],
    );
  }
}

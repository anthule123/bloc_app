import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/time_controller.dart/sonde_range.dart';
import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/one_shot_cubits/time_check/time_check_cubit.dart';
import 'no_insulin_case_representation.dart';

class NoInsulinUI extends StatelessWidget {
  const NoInsulinUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCheckCubit, int>(builder: (context, state) {
      if (context
              .read<NoInsulinCubit>()
              .state
              .regimen
              .medicalTakeInsulins
              .length >
          0) {
        DateTime last = context
            .read<NoInsulinCubit>()
            .state
            .regimen
            .medicalTakeInsulins
            .last
            .time;
        if (inSondeRangeToday(last) &&
            rangeContain(last) == rangeContain(DateTime.now())) {
          return Text('Bạn đã điều trị xong khung giờ này.');
        } else
          return NoInsulinRepresentation();
      } else
        return NoInsulinRepresentation();
    });
  }
}

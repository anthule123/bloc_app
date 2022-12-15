import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/time_controller.dart/sonde_range.dart';
import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import '../../../../../logic/one_shot_cubits/time_check/time_check_cubit.dart';
import 'yes_insulin_fast_representation.dart';

class YesInsulinFastUI extends StatelessWidget {
  const YesInsulinFastUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCheckCubit, int>(builder: (context, state) {
      if (context
              .read<YesInsulinFastCubit>()
              .state
              .regimen
              .medicalTakeInsulins
              .length >
          0) {
        DateTime last = context
            .read<YesInsulinFastCubit>()
            .state
            .regimen
            .medicalTakeInsulins
            .last
            .time;
        if (inSondeRangeToday(last) &&
            rangeContain(last) == rangeContain(DateTime.now())) {
          return Text('Bạn đã điều trị insulin nhanh xong khung giờ này.');
        } else
          return YesInsulinFastRepresentation();
      } else
        return YesInsulinFastRepresentation();
    });
  }
}

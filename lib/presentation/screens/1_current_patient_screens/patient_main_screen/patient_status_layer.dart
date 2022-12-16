import 'package:bloc_app/logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import 'package:bloc_app/presentation/screens/1_current_patient_screens/patient_main_screen/yes_insulin_fast/yes_insulin_fast_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'dart:math';
import '../../../../data/models/export.dart';
import '../../../../data/models/time_controller.dart/sonde_range.dart';
import '../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../logic/1_patient_cubits/patient_status/patient_status_cubit.dart';
import '../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_slow/yes_insulin_slow_cubit.dart';
import '../../../../logic/one_shot_cubits/time_check/time_check_cubit.dart';
import 'first_ask_ui.dart';
import 'no_insulin/no_insulin_case_representation.dart';
import 'no_insulin/no_insulin_ui.dart';

class PatientStatusLayer extends StatelessWidget {
  const PatientStatusLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PatientStatusCubit, PatientStatus>(
            builder: (context, state) {
          // return Text('${state}');
          switch (state) {
            case PatientStatus.noInsulin:
              return Text("Lộ trình không tiêm Insulin:");
            case PatientStatus.yesInsulin:
              return Text("Lộ trình đang tiêm Insulin:");
            default:
              return Text("");
          }
        }),
        BlocBuilder<PatientStatusCubit, PatientStatus>(
          builder: (context, state) {
            switch (state) {
              case PatientStatus.firstAsk:
                return FirstAskUI();
              case PatientStatus.noInsulin:
                return NoInsulinUI();
              case PatientStatus.yesInsulin:
                return Column(
                  children: [
                    YesInsulinSlowUI(),
                    YesInsulinFastUI(),
                  ],
                );
              default:
                return Column();
            }
          },
        ),
      ],
    );
  }
}

num firstSlowInsulin(num weight) {
  return ((weight * 0.2).round());
}

class YesInsulinSlowUI extends StatelessWidget {
  const YesInsulinSlowUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesInsulinSlowCubit, YesInsulinSlowStatus>(
      builder: (context, state) {
        double weight = 50;
        switch (state) {
          case YesInsulinSlowStatus.askType:
            return AskTypeSlowInsulin();
          case YesInsulinSlowStatus.NPH:
            return Column(
              children: [
                Text('+ Liều NPH: ${firstSlowInsulin(weight)}'),
              ],
            );
          case YesInsulinSlowStatus.Glargine:
            return Column(
              children: [Text('+ Liều Glargine: ${firstSlowInsulin(weight)}')],
            );
          default:
        }
        return AskTypeSlowInsulin();
      },
    );
  }
}

class AskTypeSlowInsulin extends StatelessWidget {
  const AskTypeSlowInsulin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesInsulinSlowCubit, YesInsulinSlowStatus>(
      builder: (context, state) {
        return Column(
          children: [
            Text('Loại insulin: '),
            TextButton(
              onPressed: () {
                context
                    .read<YesInsulinSlowCubit>()
                    .update(YesInsulinSlowStatus.NPH);
              },
              child: Text('NPH'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<YesInsulinSlowCubit>()
                    .update(YesInsulinSlowStatus.Glargine);
              },
              child: Text('Glargine'),
            ),
          ],
        );
      },
    );
  }
}

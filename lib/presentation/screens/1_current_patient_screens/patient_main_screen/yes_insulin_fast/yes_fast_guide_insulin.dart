import 'package:bloc_app/presentation/widgets/buttons/grey_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import '../../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';

class YesInsulinFastGuideInsulin extends StatelessWidget {
  const YesInsulinFastGuideInsulin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocProvider(
        create: (_) => TextFormCubit(),
        child: BlocBuilder<TextFormCubit, String>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(BlocProvider.of<YesInsulinFastCubit>(context)
                      .state
                      .notice),
                  YesInsulinFastGetGuideButton(),
                ],
              ),
            );
          },
        ),
      ),
    ]);
  }
}

class YesInsulinFastGetGuideButton extends StatelessWidget {
  const YesInsulinFastGetGuideButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NiceButtons(
      stretch: false,
      onTap: (finish) {
        BlocProvider.of<YesInsulinFastCubit>(context).getGuide();
      },
      child: Text('Tiêm xong'),
    );
  }
}

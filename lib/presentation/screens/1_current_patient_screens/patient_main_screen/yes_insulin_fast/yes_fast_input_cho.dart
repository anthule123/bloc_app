import 'package:bloc_app/presentation/widgets/buttons/grey_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import '../../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';
import '../no_insulin/input_cho.dart';

class YesInsulinFastInputCHO extends StatelessWidget {
  const YesInsulinFastInputCHO({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Điền lượng carbonhydrate (g):',
        textScaleFactor: 1.2,
        textAlign: TextAlign.left,
      ),
      BlocProvider(
        create: (_) => TextFormCubit(),
        child: BlocBuilder<TextFormCubit, String>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0',
                      ),
                      onChanged: (text) {
                        BlocProvider.of<TextFormCubit>(context).update(text);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                YesInsulinFastCHOButton(),
                // Text(BlocProvider.of<NoInsulinCubit>(context)
                //     .state
                //     .medicalStatus
                //     .toString()),
              ],
            );
          },
        ),
      ),
    ]);
  }
}



class YesInsulinFastCHOButton extends StatelessWidget {
  const YesInsulinFastCHOButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesInsulinFastCubit, NoInsulinState>(
      builder: ((context, state) {
        if (checkNum(BlocProvider.of<TextFormCubit>(context).state)) {
          return NiceButtons(
            stretch: false,
            onTap: (finish) {
              double cho =
                  double.parse(BlocProvider.of<TextFormCubit>(context).state);
              BlocProvider.of<YesInsulinFastCubit>(context).getCarbonhydrate(cho);
            },
            child: Text('Tiếp tục'),
          );
        } else
          return Column(
            children: [
              Text('Bạn cần điền dưới dạng số'),
              SizedBox(height: 20),
              GreyNextButton(),
            ],
          );
      }),
    );
  }
}

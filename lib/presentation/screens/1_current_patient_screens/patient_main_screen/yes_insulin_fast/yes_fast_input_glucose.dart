import 'package:bloc_app/presentation/widgets/buttons/grey_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../../../logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import '../../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';

class YesInsulinFastInputGlucose extends StatelessWidget {
  const YesInsulinFastInputGlucose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Điền lượng glucose (UI):',
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
                YesInsulinFastGlucoseButton(),
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

bool checkNum(String text) {
  return double.tryParse(text) != null;
}

class YesInsulinFastGlucoseButton extends StatelessWidget {
  const YesInsulinFastGlucoseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkNum(BlocProvider.of<TextFormCubit>(context).state)) {
      return NiceButtons(
        stretch: false,
        onTap: (finish) async {
          double glucose =
              double.parse(BlocProvider.of<TextFormCubit>(context).state);
          BlocProvider.of<YesInsulinFastCubit>(context).takeGlucose(glucose);
          //   print(context.read<NoInsulinCubit>().state.medicalStatus);
        },
        child: Text('Tiếp tục'),
      );
    } else
      return Column(
        children: [
          Text('Bạn cần điền dưới dạng số'),
          SizedBox(height: 20),
          GreyNextButton(),
          // Text(BlocProvider.of<NoInsulinCubit>(context)
          //     .state
          //     .medicalStatus
          //     .toString()),
        ],
      );
  }
}

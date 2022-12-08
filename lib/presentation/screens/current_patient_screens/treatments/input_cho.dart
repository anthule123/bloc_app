import 'package:bloc_app/logic/no_insulin_cubits/no_insulin_cubit.dart';
import 'package:bloc_app/presentation/widgets/grey_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../logic/cubits/text_form/text_form_cubit.dart';

class inputCHO extends StatelessWidget {
  const inputCHO({
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
        child: BlocBuilder<TextFormCubit, TextFormState>(
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
                CHO_Button(),
                Text(BlocProvider.of<NoInsulinCubit>(context)
                    .state
                    .medicalStatus
                    .toString()),
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

class CHO_Button extends StatelessWidget {
  const CHO_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoInsulinCubit, NoInsulinState>(
      builder: ((context, state) {
        if (checkNum(
            BlocProvider.of<TextFormCubit>(context).state.text.toString())) {
          return NiceButtons(
            stretch: false,
            onTap: (finish)  {
              double cho =  double.parse(
                  BlocProvider.of<TextFormCubit>(context)
                      .state
                      .text
                      .toString());
              BlocProvider.of<NoInsulinCubit>(context)
                  .getCarbonhydrate(cho);
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

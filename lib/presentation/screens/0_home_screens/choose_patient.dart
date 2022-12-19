import 'package:bloc_app/data/data_providers/home/check_existed_id.dart';
import 'package:bloc_app/logic/0_home_cubits/choose_patient/check_existed_id_cubit.dart';
import 'package:bloc_app/logic/0_home_cubits/choose_patient/choose_patient_cubit.dart';
import 'package:bloc_app/logic/one_shot_cubits/text_form/text_form_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePatientAction extends StatelessWidget {
  ChoosePatientAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          ' Chọn ID bệnh nhân:',
          textScaleFactor: 1.1,
          textAlign: TextAlign.left,
        ),
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => TextFormCubit(),
            ),
            BlocProvider(
              create: (_) => CheckExistedIDCubit(),
            )
          ],
          child: BlocBuilder<TextFormCubit, String>(
            builder: (context, state) {
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ID',
                          fillColor: Colors.white,
                        ),
                        onChanged: (text) {
                          BlocProvider.of<TextFormCubit>(context).update(text);
                          BlocProvider.of<CheckExistedIDCubit>(context)
                              .check(text);
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<CheckExistedIDCubit, bool>(
                      builder: (context, state) {
                    if (state == true) {
                      return PickerPatientButton();
                    } else
                      return Text('ID nay ko hop le');
                  }),
                  // PickerPatientButton(),
                  Text(BlocProvider.of<TextFormCubit>(context).state),
                ].reversed.toList(),
              );
            },
          ),
        ),
        BlocBuilder<ChoosePatientCubit, String>(
          builder: (context, state) {
            return Text('ID hien tai la ${state}');
          },
        )
      ],
    );
  }
}

class PickerPatientButton extends StatelessWidget {
  const PickerPatientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<ChoosePatientCubit, String>(
          listener: (context, state) {},
          builder: (context, state) {
            String id = context.read<TextFormCubit>().state;

            return Column(
              children: [
                //Text('ID nay hop le'),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ChoosePatientCubit>(context).update(id);
                  },
                  icon: Icon(Icons.back_hand_rounded),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

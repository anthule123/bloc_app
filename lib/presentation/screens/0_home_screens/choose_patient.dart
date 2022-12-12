import 'package:bloc_app/data/data_providers/home/check_existed_id.dart';
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
                        },
                      ),
                    ),
                  ),
                  PickerPatientButton(),
                  Text(BlocProvider.of<TextFormCubit>(context).state),
                ],
              );
            },
          ),
        ),
        BlocBuilder<ChoosePatientCubit, ChoosePatientState>(
          builder: (context, state) {
            return Text('ID hien tai la${state.value}');
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
        BlocConsumer<ChoosePatientCubit, ChoosePatientState>(
          listener: (context, state) {},
          builder: (context, state) {
            String id = context.read<TextFormCubit>().state;
            BlocProvider.of<ChoosePatientCubit>(context).checkNewID(id);
            switch (BlocProvider.of<ChoosePatientCubit>(context)
                .state
                .choosePatientTemp) {
              case ChoosePatientTemp.accepted:
                return Text('OK');
              case ChoosePatientTemp.rejected:
                return Text('ID nay ko hop le');
              default:
                return Text('bo tay');
            }
          },
        ),
      ],
    );
  }
}

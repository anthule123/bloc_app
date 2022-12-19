import 'package:bloc_app/presentation/screens/0_home_screens/create_patient/create_name.dart';
import 'package:bloc_app/presentation/widgets/buttons/exit_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../../../logic/one_shot_cubits/text_form/text_form_cubit.dart';
import '../../../widgets/bars/bottom_navitgator_bar.dart';
import '../../../widgets/buttons/grey_next_button.dart';

class PatientProfileMakingID extends StatelessWidget {
  const PatientProfileMakingID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lập hồ sơ bệnh nhân (ID)'),
        //automaticallyImplyLeading: false,
      ),
      body: create_ID(),
      //  bottomNavigationBar: bottomNavigator(),
    );
  }
}

class create_ID extends StatelessWidget {
  const create_ID({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextFormCubit(),
      child: BlocBuilder<TextFormCubit, String>(
        builder: (context, state) => ListView(
          padding: EdgeInsets.all(32),
          children: [
            SizedBox(height: 20),
            Text(
              ' Điền id bệnh nhân (10 chữ số):',
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
            ),
            Center(
              child: SizedBox(
                width: 300.0,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ID',
                  ),
                  onChanged: (text) {
                    BlocProvider.of<TextFormCubit>(context).update(text);
                    BlocProvider.of<PatientCreationCubit>(context)
                        .updateID(text);
                  },
                ),
              ),
            ),
            Text(BlocProvider.of<PatientCreationCubit>(context)
                .state
                .profile
                .name),
            Text(BlocProvider.of<PatientCreationCubit>(context)
                .state
                .profile
                .id),
            ConfirmButton(notice: 'ID'),
          ],
        ),
      ),
    );
  }
}

bool checkID(String id) {
  return id.length == 10;
}

class ConfirmButton extends StatelessWidget {
  final String notice;
  const ConfirmButton({
    Key? key,
    required this.notice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkID(BlocProvider.of<TextFormCubit>(context).state)) {
      return NiceButtons(
          stretch: false,
          onTap: (finish) {
            showDialog(
                context: context,
                builder: (_) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      title: Text('Xác nhận'),
                      content: Container(
                        height: height * 0.35,
                        width: width * 0.75,
                        child: Column(
                          children: [
                            Text('Bạn sẽ thêm bệnh nhân với thông tin này.'),
                            NiceButtons(
                                stretch: false,
                                onTap: (finish) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.of(context, rootNavigator: true)
                                      .popAndPushNamed('/profileMakingFinal');
                                },
                                child: Text('Đúng rồi!')),
                            SizedBox(
                              height: 20,
                            ),
                            exitDialogButton(
                              text: 'Chưa, để tôi xem lại đã',
                            ),
                          ],
                        ),
                      ));
                });
          },
          child: Text('Xác nhận'));
    } else
      return Column(
        children: [
          Text('Bạn cần nhập ID đủ 10 chữ'),
          GreyNextButton(),
        ],
      );
  }
}

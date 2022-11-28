import 'package:bloc_app/logic/cubits/text_form/text_form_cubit.dart';
import 'package:bloc_app/presentation/widgets/exit_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../logic/cubits/patient_add/patient_add_cubit.dart';
import '../../widgets/bottom_navitgator.dart';

class PatientProfileMakingID extends StatelessWidget {
  const PatientProfileMakingID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lập hồ sơ bệnh nhân (ID)'),
      ),
      body: create_ID(),
            bottomNavigationBar: bottomNavigator(),

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
      child: BlocBuilder<TextFormCubit, TextFormState>(
        builder: (context, state) => Column(
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
                    BlocProvider.of<PatientAddCubit>(context).updateID(text);
                  },
                ),
              ),
            ),
            Text(
                BlocProvider.of<PatientAddCubit>(context).state.patient.name),
            Text(BlocProvider.of<PatientAddCubit>(context).state.patient.id),
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
    if (checkID(BlocProvider.of<TextFormCubit>(context).state.text))
      return NiceButtons(
          stretch: false,
          onTap: (finish) {
            showDialog(
                context: context,
                builder: (_) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
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
                                  Navigator.of(context)
                                      .pushNamed('/profileMakingFinal');
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
    else
      return Text('Bạn cần nhập ${this.notice} gồm 10 kí tự.');
  }
}

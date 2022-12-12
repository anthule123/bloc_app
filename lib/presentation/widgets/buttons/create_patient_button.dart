import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../icons/add_patient_icon.dart';
import 'exit_dialog_button.dart';

class CreatePatientButton extends StatelessWidget {
  const CreatePatientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Text('Thêm bệnh nhân'),
                content: Container(
                  height: height * 0.25,
                  width: width * 0.75,
                  child: Column(
                    children: <Widget>[
                      NiceButtons(
                        startColor: Colors.green.shade700,
                        endColor: Colors.green.shade700,
                        progress: false,
                        gradientOrientation: GradientOrientation.Horizontal,
                        onTap: (finish) {
                          Navigator.of(context)
                              .popAndPushNamed('/profileMaking');
                        },
                        child: Text('Tạo hồ sơ'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      exitDialogButton(),
                    ],
                  ),
                ),
              );
            });
      },
      icon: AddPatientIcon(),
    );
  }
}

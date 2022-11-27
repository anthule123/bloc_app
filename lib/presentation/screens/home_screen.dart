// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import 'package:bloc_app/logic/cubits/internet/internet_cubit.dart';

import '../widgets/add_patient_icon.dart';
import '../widgets/exit_dialog_button.dart';
import '../widgets/internet_check_widgets.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;
  const HomeScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // setFirebase();
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          InternetCheck(),
          IconButton(
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
                              gradientOrientation:
                                  GradientOrientation.Horizontal,
                              onTap: (finish) async {
                                final value = await Navigator.of(context)
                                    .pushNamed('/profileMaking');
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
            icon: addPatientIcon(),
          )
        ],
      ),
    );
  }
}

Future<void> setFirebase() async {
  // Firebase.initializeApp();
  final city = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
  };
  var db = FirebaseFirestore.instance;
  db
      .collection("patient")
      .doc("6")
      .set(city)
      .onError((e, _) => print("Error writing document: $e"));
}

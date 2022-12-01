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
import '../widgets/bars/bottom_navitgator.dart';
import '../widgets/create_patient_button.dart';
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
          CreatePatientButton(),
        ],
      ),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

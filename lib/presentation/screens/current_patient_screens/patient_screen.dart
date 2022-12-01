// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../widgets/bars/patient_bar.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PatientBar(),
      ),

      body: Column(
        children: [],
      ),

      // body: top_navigation_bar_patient(),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}


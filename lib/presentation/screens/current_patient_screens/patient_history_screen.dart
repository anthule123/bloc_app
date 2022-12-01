import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/bars/patient_bar.dart';

class PatientHistoryScreen extends StatelessWidget {
  const PatientHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: PatientBar()),
      body: Column(),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

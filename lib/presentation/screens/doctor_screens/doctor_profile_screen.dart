import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator.dart';
import 'package:bloc_app/presentation/widgets/bars/doctor_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DoctorBar(),
      ),
      body: Column(),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

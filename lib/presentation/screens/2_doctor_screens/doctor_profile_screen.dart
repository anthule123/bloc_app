import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator_bar.dart';
import 'package:bloc_app/presentation/widgets/bars/doctor_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: DoctorNavigatorBar(),
      ),
      body: Column(),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

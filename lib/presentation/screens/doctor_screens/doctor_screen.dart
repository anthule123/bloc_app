import 'package:bloc_app/logic/bar_cubits/doctor_bar/doctor_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../widgets/bars/bottom_navitgator.dart';
import '../../widgets/bars/doctor_bar.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DoctorBar(),
      ),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}


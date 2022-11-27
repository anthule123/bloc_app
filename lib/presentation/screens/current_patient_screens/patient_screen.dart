import 'package:bloc_app/presentation/widgets/bottom_navitgator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bệnh nhân'),
      ),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

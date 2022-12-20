import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/bars/patient_navigator_bar.dart';

// Tạo form để hiển thị thông tin của bệnh nhân
class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: PatientNavigatorBar(),
      ),
      // Tạo tên, tuổi, cân nặng, chiều cao của bệnh nhân, TextSize: 20, Thêm khoảng trắng ở giữa
      body: Container(
        child: Column(
          children: [
            Text(
              'Tên: ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Tuổi: ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Cân nặng: ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Chiều cao: ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            // Tạo nút để thêm thông tin bệnh nhân
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

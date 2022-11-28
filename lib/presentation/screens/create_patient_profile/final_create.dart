import 'package:bloc_app/logic/cubits/patient_add/patient_add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/patient.dart';
import '../../widgets/bottom_navitgator.dart';

class FinalCreatePatient extends StatefulWidget {
  const FinalCreatePatient({super.key});

  @override
  State<FinalCreatePatient> createState() => _FinalCreatePatientState();
}

class _FinalCreatePatientState extends State<FinalCreatePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả nộp hồ sơ'),
      ),
      body: BlocBuilder<PatientAddCubit, PatientAddState>(
          builder: (context, state) {
        BlocProvider.of<PatientAddCubit>(context).sendData();
        if (state.data_sending == dataSending.failure) {
          return Text('Hồ sơ này được cập nhật thất bại');
        } else if (state.data_sending == dataSending.sending) {
          return Text('Đang gửi hồ sơ đến Firebase.');
        } else if (state.data_sending == dataSending.success) {
          return Text('Hồ sơ này được cập nhật thành công.');
        } else {
          return Text('Có lỗi xảy ra');
        }
      }),
      bottomNavigationBar: bottomNavigator(),
    );
  }
}

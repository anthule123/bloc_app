import 'package:bloc_app/logic/export.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../../widgets/bars/bottom_navitgator_bar.dart';

class FinalCreatePatient extends StatelessWidget {
  const FinalCreatePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kết quả nộp hồ sơ'),
        //    automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          BlocBuilder<PatientCreationCubit, PatientCreationState>(
              builder: (context, state) {
            BlocProvider.of<PatientCreationCubit>(context).sendData();
            switch (state.dataSending) {
              case DataSending.failure:
                return Text('Hồ sơ này được cập nhật thất bại');
              case DataSending.sending:
                return Text('Đang gửi hồ sơ đến Firebase.');
              case DataSending.success:
                return Text('Hồ sơ này được cập nhật thành công');
              case DataSending.no_send:
                return Text('Hồ sơ này chưa được gửi lên');
              default:
                return Text('Có lỗi xảy ra');
            }
          }),
          IconButton(
            onPressed: () {
              BlocProvider.of<BottomNavigatorBarCubit>(context).update(0);
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context, rootNavigator: true)
                  .pushReplacementNamed('/');
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

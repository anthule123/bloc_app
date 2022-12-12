import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bar_cubits/navigator_bar_cubit.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext bottomNavigatorcontext) {
    return BlocBuilder<BottomNavigatorBarCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/icons/patient_icon3.png",
                    height: 50, width: 50),
                label: 'Bệnh nhân',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/doctor_icon2.jpg",
                  height: 50,
                  width: 50,
                ),
                label: 'Bác sĩ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Cài đặt',
              ),
            ],
            //BlocProvider.of<PatientAddCubit>(context)
            currentIndex: state,
            //backgroundColor: Colors.blue.shade100,
            selectedIconTheme: IconThemeData(
              color: Colors.green[900],
            ),
            selectedItemColor: Colors.green[900],
            onTap: (index) {
              BlocProvider.of<BottomNavigatorBarCubit>(context).update(index);
              bottomNavigator(index, context);
            });
      },
    );
  }
}

void bottomNavigator(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.of(context, rootNavigator: true).pushReplacementNamed('/');
      break;
    case 1:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/patient');
      break;
    case 2:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/doctor');
      break;
    case 3:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/settings');
      break;
    default:
  }
}

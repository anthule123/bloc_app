import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/navigator_bar/navigator_bar_cubit.dart';

class bottomNavigator extends StatelessWidget {
  const bottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBarCubit, NavigatorBarState>(
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
          currentIndex: getIndex(BlocProvider.of<NavigatorBarCubit>(context)
              .state
              .navigatorBarStatus),
          selectedItemColor: Colors.amber[800],
          onTap: (index) => navigate(index, context),
        );
      },
    );
  }

  void navigate(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          BlocProvider.of<NavigatorBarCubit>(context)
              .updateNavigator(NavigatorBarStatus.home);
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil('/', (route) => false);
        }
        break;
      case 1:
        {
          BlocProvider.of<NavigatorBarCubit>(context).state.navigatorBarStatus =
              NavigatorBarStatus.patient;
          Navigator.of(context, rootNavigator: true)
              .pushReplacementNamed('/patient');
        }
        break;
      case 2:
        {
          BlocProvider.of<NavigatorBarCubit>(context).state.navigatorBarStatus =
              NavigatorBarStatus.doctor;
          Navigator.of(context, rootNavigator: true)
              .pushReplacementNamed('/doctor');
        }
        break;
      case 3:
        {
          BlocProvider.of<NavigatorBarCubit>(context).state.navigatorBarStatus =
              NavigatorBarStatus.setting;
          Navigator.of(context, rootNavigator: true)
              .pushReplacementNamed('/setting');
        }
        break;
    }
  }
}

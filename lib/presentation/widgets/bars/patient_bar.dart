import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../logic/bar_cubits/patient_bar/patient_bar_cubit.dart';


class PatientBar extends StatelessWidget {
  const PatientBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBarCubit, PatientBarState>(
      builder: (context, state) {
        return SalomonBottomBar(
          onTap: (p0) {
            BlocProvider.of<PatientBarCubit>(context).updateIndex(p0);
            patient_navigator(p0, context);
          },
          currentIndex: BlocProvider.of<PatientBarCubit>(context).state.index,
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.medical_services),
                title: Text("Điều trị"),
                selectedColor: Colors.orange,
                unselectedColor: Colors.white),
            SalomonBottomBarItem(
                icon: Icon(Icons.notes_rounded),
                title: Text("Lịch sử"),
                selectedColor: Colors.orange,
                unselectedColor: Colors.white),
            SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Hồ sơ"),
                selectedColor: Colors.orange,
                unselectedColor: Colors.white)
          ],
        );
      },
    );
  }
}

void patient_navigator(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/patient');
      break;
    case 1:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/patient/history');
      break;
    case 2:
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/patient/profile');
      break;
    default:
  }
}

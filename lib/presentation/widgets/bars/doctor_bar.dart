import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../logic/bar_cubits/doctor_bar/doctor_bar_cubit.dart';

class DoctorBar extends StatelessWidget {
  const DoctorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBarCubit, DoctorBarState>(
      builder: (context, state) {
        return SalomonBottomBar(
          onTap: (p0) {
            BlocProvider.of<DoctorBarCubit>(context).updateIndex(p0);
            doctor_navigate(p0, context);
          },
          currentIndex: BlocProvider.of<DoctorBarCubit>(context).state.index,
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.people),
                title: Text("Các bệnh nhân"),
                selectedColor: Colors.orange,
                unselectedColor: Colors.white),
            SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Hồ sơ bác sĩ"),
                selectedColor: Colors.orange,
                unselectedColor: Colors.white)
          ],
        );
      },
    );
  }
}

void doctor_navigate(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.of(context).popAndPushNamed('/doctor');
      break;
    case 1:
      Navigator.of(context).popAndPushNamed('/doctor/profile');
      break;
    default:
  }
}

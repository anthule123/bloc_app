import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../logic/bar_cubits/navigator_bar_cubit.dart';

class DoctorNavigatorBar extends StatelessWidget {
  const DoctorNavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext doctorBarcontext) {
    return BlocBuilder<DoctorNavigatorBarCubit, int>(
      builder: (context, state) {
        return SalomonBottomBar(
          onTap: (p0) {
            BlocProvider.of<DoctorNavigatorBarCubit>(context).update(p0);
            doctorNavigate(p0, context);
          },
          currentIndex: BlocProvider.of<DoctorNavigatorBarCubit>(context).state,
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

void doctorNavigate(int index, BuildContext context) {
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

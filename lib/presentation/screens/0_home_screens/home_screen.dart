import 'package:bloc_app/logic/one_shot_cubits/internet/internet_cubit.dart';
import 'package:bloc_app/presentation/screens/0_home_screens/choose_patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/export_widgets.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final Color color;
  const HomeScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext homeScreenContext) {
    // setFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        shrinkWrap: true,
        reverse: true,
        children: <Widget>[
          BlocBuilder<InternetCubit, InternetState>(builder: ((context, state) {
            switch (state.runtimeType) {
              case InternetConnected:
                return Column(
                  children: [
                    CreatePatientButton(),
                    ChoosePatientAction(),
                  ].toList(),
                );

              default:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Đang chưa có Internet.'),
                    Text(' Bạn kết nối Internet để sử dụng app nhé!'),
                  ],
                );
            }
          })),
        ].toList(),
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/cubits/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'Home'),
      ),
    );
  }
}
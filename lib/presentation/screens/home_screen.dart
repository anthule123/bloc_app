// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/cubits/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/internet_check_widgets.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          InternetCheck(),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/cubits/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class InternetCheck extends StatelessWidget {
  const InternetCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state == InternetLoading()) {
          return LoadingInternet();
        } else if (state == InternetConnected()) {
          return HavingInternet();
        } else
          return NoInternet();
      },
    );
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Đang không có Internet'),
      content: Center(
          child: Text('Bạn phải có kết nối Internet thì mới chạy được app')),
    );
  }
}

class HavingInternet extends StatelessWidget {
  const HavingInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text('Đang có internet'));
  }
}

class LoadingInternet extends StatelessWidget {
  const LoadingInternet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Đang load internet');
  }
}

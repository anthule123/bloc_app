import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/one_shot_cubits/internet/internet_cubit.dart';

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
    return SizedBox(
      height: 10,
    );
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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class TimeCheckCubit extends Cubit<DateTime> {
  StreamController _secondsStreamController = StreamController();
  TimeCheckCubit() : super(DateTime.now()) {}

  Future decreaseSeconds() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(DateTime.now());
    print('update');
  }

  @override
  Future<void> close() {
    _secondsStreamController.close();
    return super.close();
  }
}

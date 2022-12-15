// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';

Stream<int> secondStream() {
  return Stream.periodic(Duration(seconds: 1), (x) => x);
}

class TimeCheckCubit extends Cubit<int> {
  final Stream<int> ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimeCheckCubit({required Stream<int> ticker})
      : ticker = ticker,
        super(1) {
    _tickerSubscription = ticker.listen((duration) => emit(-state));
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}

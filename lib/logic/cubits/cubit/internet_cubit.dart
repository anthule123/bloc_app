// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  InternetCubit({
    required this.connectivity,
  }) : super(InternetLoading()) {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          emitInternetConnected();
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emitInternetConnected();
        } else if (connectivityResult == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      },
    );
  }
  void emitInternetConnected() {
    return emit(InternetConnected());
  }

  void emitInternetDisconnected() {
    return emit(InternetDisconnected());
  }
}

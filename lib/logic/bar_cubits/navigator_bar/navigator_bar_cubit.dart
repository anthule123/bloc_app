import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_bar_state.dart';

class NavigatorBarCubit extends Cubit<NavigatorBarState> {
  NavigatorBarCubit() : super(NavigatorBarState());
  void updateNavigator(NavigatorBarStatus navi) {
    if (navi == state.navigatorBarStatus) {
      return;
    }
    state.navigatorBarStatus = navi;
  }
}

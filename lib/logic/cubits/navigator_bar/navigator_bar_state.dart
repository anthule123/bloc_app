// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigator_bar_cubit.dart';

enum NavigatorBarStatus {
  home,
  patient,
  doctor,
  setting,
}

int getIndex(NavigatorBarStatus navi) {
  switch (navi) {
    case NavigatorBarStatus.home:
      return 0;
    case NavigatorBarStatus.patient:
      return 1;
    case NavigatorBarStatus.doctor:
      return 2;
    case NavigatorBarStatus.setting:
      return 3;
  }
}

class NavigatorBarState extends Equatable {
  NavigatorBarStatus navigatorBarStatus = NavigatorBarStatus.home;
  NavigatorBarState({
    this.navigatorBarStatus = NavigatorBarStatus.home,
  });

  @override
  List<Object> get props => [this.navigatorBarStatus];
}

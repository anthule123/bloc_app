part of 'doctor_bar_cubit.dart';

class DoctorBarState extends Equatable {
  int index = 0;
  DoctorBarState({this.index = 0});

  @override
  List<Object> get props => [this.index];
}


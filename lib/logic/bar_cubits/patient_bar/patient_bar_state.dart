// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'patient_bar_cubit.dart';

class PatientBarState extends Equatable {
  int index = 0;
  PatientBarState({this.index = 0});

  @override
  List<Object> get props => [this.index];
}

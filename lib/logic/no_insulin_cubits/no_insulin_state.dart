// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'no_insulin_cubit.dart';

enum MedicalStatus {
  gettingCHO,
  checkingGlucose,
  guidingInsulin,
  waiting, 
}

class NoInsulinState extends Equatable {
  Regimen regimen;
  dynamic guide;
  int currentInsulin = 0;
  int bonusInsulin = 0;
  String notice = '';
  MedicalStatus medicalStatus = MedicalStatus.gettingCHO;
  NoInsulinState({
    required this.regimen,
  });

  @override
  List<Object> get props => [
        this.regimen,
  ];
}

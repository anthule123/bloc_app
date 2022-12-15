// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'no_insulin_cubit.dart';

enum MedicalStatus {
  gettingCHO,
  checkingGlucose,
  guidingInsulin,
  waiting,
}

class NoInsulinState {
  Regimen regimen;
  MedicalTakeInsulin guide;
  int currentInsulin = 0;
  int bonusInsulin = 0;
  String notice = '';
  MedicalStatus medicalStatus = MedicalStatus.gettingCHO;
  int badGlucose = 0;
  bool goToNextRegimen = false;
  NoInsulinState({
    required this.regimen,
    required this.guide,
    this.currentInsulin = 0,
    this.bonusInsulin = 0,
    this.notice = '',
    this.medicalStatus = MedicalStatus.gettingCHO,
    this.badGlucose = 0,
    this.goToNextRegimen = false,
  });

  // @override
  // List<Object> get props => [
  //       this.regimen,
  //       this.guide,
  //       this.currentInsulin,
  //       this.bonusInsulin,
  //       this.notice,
  //       this.medicalStatus
  //     ];
  NoInsulinState hotClone() {
    return NoInsulinState(
      regimen: regimen,
      guide: guide,
      currentInsulin: currentInsulin,
      bonusInsulin: bonusInsulin,
      notice: notice,
      medicalStatus: medicalStatus,
      badGlucose: badGlucose,
      goToNextRegimen: goToNextRegimen,
    );
  }
}

NoInsulinState initNoInsulinState() {
  return NoInsulinState(
    regimen: initialRegimen(),
    guide: InitMedicalTakeInsulin(),
  );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';
import 'package:bloc_app/data/data_providers/patient/get_no_insulin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_app/logic/0_home_cubits/choose_patient/choose_patient_cubit.dart';
import 'package:bloc/bloc.dart';

import '../../../data/models/export.dart';

part 'no_insulin_state.dart';

MedicalTakeInsulin InitMedicalTakeInsulin() {
  return MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid, time: DateTime.now(), insulinUI: 0);
}

class NoInsulinCubit extends Cubit<NoInsulinState> {
  int badGlucose = 0;

  NoInsulinCubit()
      : super(NoInsulinState(
          regimen: initialRegimen(),
          guide: InitMedicalTakeInsulin(),
        ));

  void getCarbonhydrate(double cho) {
    NoInsulinState newState = state.hotClone();
    newState.currentInsulin = (cho / 15).round();
    newState.guide = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: newState.currentInsulin,
    );
    //Sau khi nhập CHO thì sẽ nhập glucose
    newState.medicalStatus = MedicalStatus.checkingGlucose;
    emit(newState);
  }

  void getGuide() {
    //Thêm action tiêm insulin vào regimen
    NoInsulinState newState = state.hotClone();
    newState.guide.time = DateTime.now();
    newState.regimen.addMedicalAction(newState.guide);
    updateGoToNextRegimen();
    newState.medicalStatus = MedicalStatus.checkingGlucose;
    emit(newState);
    //Sau khi tiêm xong thì nhập CHO
  }

  void newStatus(MedicalStatus medicalStatus) {
    NoInsulinState newState = state.hotClone();
    newState.medicalStatus = medicalStatus;
    emit(newState);
  }

  void takeGlucose(double glucose) async {
    //Nhận kết quả glucose của bệnh nhân
    NoInsulinState newState = state.hotClone();
    MedicalCheckGlucose medicalCheckGlucose = MedicalCheckGlucose(
      time: DateTime.now(),
      glucoseUI: glucose,
    );
    newState.regimen.addMedicalAction(medicalCheckGlucose);

    if (lowBadGlucose(glucose)) {
      newState.notice = 'Duy trì ${newState.currentInsulin} UI Actrapid';
    } else if (mediumBadGlucose(glucose)) {
      newState.bonusInsulin += 2;
      newState.notice =
          'Bổ sung 2 UI insulin Actrapid \n Tiêm ${newState.currentInsulin + newState.bonusInsulin} UI Actrapid';
    } else if (highBadGlucose(glucose)) {
      newState.bonusInsulin += 4;
      newState.notice =
          'Bổ sung 4 UI insulin Actrapid \n Tiêm ${newState.currentInsulin + newState.bonusInsulin} UI Actrapid';
    }
    newState.guide.insulinUI = newState.currentInsulin + newState.bonusInsulin;
    newState.medicalStatus = MedicalStatus.guidingInsulin;
    emit(newState);
    updateBadGlucose(glucose);
  }

  //Cac ham phu: update badGlucose và update goToNextRegimen
  void updateBadGlucose(num glucose) {
    int counter = 0;
    int len = state.regimen.medicalCheckGlucoses.length;
    for (int i = len - 1; i >= max(0, len - 8); i--) {
      if (bad(state.regimen.medicalCheckGlucoses[i].glucoseUI)) {
        counter++;
      }
    }
    print('hello');
    badGlucose = counter;
  }

  void updateGoToNextRegimen() {
    dynamic newState = state.hotClone();
    if (badGlucose >= 5) {
      newState.goToNextRegimen = true;
    }
    emit(newState);
  }
}

bool bad(num glucose) {
  return (glucose > 8.3 || glucose < 3.9);
}

bool lowBadGlucose(num glucose) {
  return 3.9 <= glucose && glucose <= 8.3;
}

bool mediumBadGlucose(num glucose) {
  return 8.3 <= glucose && glucose <= 11.1;
}

bool highBadGlucose(num glucose) {
  return 11.1 < glucose;
}

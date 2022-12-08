import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/export.dart';

part 'no_insulin_state.dart';

class NoInsulinCubit extends Cubit<NoInsulinState> {
  NoInsulinCubit()
      : super(NoInsulinState(
          regimen: InitialRegimen(),
        ));

  Future<void> getCarbonhydrate(double cho) async {
    state.currentInsulin =  (cho / 15).round();
    state.guide =  MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: state.currentInsulin,
    );
    //Sau khi nhập CHO thì sẽ nhập glucose
    state.medicalStatus = MedicalStatus.checkingGlucose;
    emit(state);
  }

  Future<void> getGuide() async {
    //Thêm action tiêm insulin vào regimen
    state.guide.time = DateTime.now();
    state.regimen.addMedicalAction(state.guide);
    state.medicalStatus = MedicalStatus.gettingCHO;
    emit(state);
    //Sau khi tiêm xong thì nhập CHO
  }

  Future<void> takeGlucose(double glucose) async {
    //Nhận kết quả glucose của bệnh nhân
    MedicalCheckGlucose medicalCheckGlucose = MedicalCheckGlucose(
      time: DateTime.now(),
      glucoseUI: glucose,
    );
    state.regimen.addMedicalAction(medicalCheckGlucose);
    if (3.9 <= glucose && glucose <= 8.3) {
      state.notice = 'Duy trì ${state.currentInsulin} UI Actrapid';
    } else if (8.3 <= glucose && glucose <= 11.1) {
      state.bonusInsulin += 2;
      state.notice =
          'Tiêm ${state.currentInsulin + state.bonusInsulin} UI Actrapid';
    } else if (11.1 <= glucose) {
      state.bonusInsulin += 4;
      state.notice =
          'Tiêm ${state.currentInsulin + state.bonusInsulin} UI Actrapid';
    }
    state.guide.insulinUI = state.currentInsulin + state.bonusInsulin;
    state.medicalStatus = MedicalStatus.guidingInsulin;
    emit(state);
  }
}

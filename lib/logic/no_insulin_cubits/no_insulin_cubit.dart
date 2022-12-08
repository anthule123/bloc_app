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

  void getCarbonhydrate(double cho)  {
    state.currentInsulin = (cho / 15).round();
    state.guide = MedicalTakeInsulin(
      insulinType: InsulinType.Actrapid,
      time: DateTime.now(),
      insulinUI: state.currentInsulin,
    );
    //Sau khi nhập CHO thì sẽ nhập glucose
    state.medicalStatus = MedicalStatus.checkingGlucose;
  }

  void getGuide()  {
    //Thêm action tiêm insulin vào regimen
    state.guide.time = DateTime.now();
    state.regimen.addMedicalAction(state.guide);
    state.medicalStatus = MedicalStatus.gettingCHO;
    //Sau khi tiêm xong thì nhập CHO
  }

  void takeGlucose(double glucose) {
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
  }
}

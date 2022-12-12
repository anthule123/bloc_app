// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:bloc_app/data/data_providers/home/check_existed_id.dart';

class ChoosePatientCubit extends Cubit<ChoosePatientState> {
  ChoosePatientCubit() : super(ChoosePatientState(value: 'Unknown'));
  void updateID(String ID) {
    ChoosePatientState newState = state.hotClone();
    newState.value = ID;
    newState.choosePatientTemp = ChoosePatientTemp.accepted;
    emit(newState);
  }

  Future<void> checkNewID(String ID) async {
    bool ans = await checkExistedID(ID);
    if (ans == true) {
      updateID(ID);
    } else {
      ChoosePatientState newState = state.hotClone();
      newState.choosePatientTemp = ChoosePatientTemp.rejected;
      emit(newState);
    }
  }
}

enum ChoosePatientTemp { rejected, accepted }

class ChoosePatientState {
  String value;
  ChoosePatientTemp choosePatientTemp;
  ChoosePatientState({
    required this.value,
    this.choosePatientTemp = ChoosePatientTemp.rejected,
  });
  ChoosePatientState hotClone() {
    return ChoosePatientState(
      value: value,
      choosePatientTemp: choosePatientTemp,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:bloc_app/logic/0_home_cubits/choose_patient/choose_patient_cubit.dart';

enum PatientStatus {
  firstAsk,
  noInsulin,
  yesInsulin,
  highInsulin,
  finish,
}

class PatientStatusCubit extends Cubit<PatientStatus> {
  final ChoosePatientCubit choosePatientCubit;
  PatientStatusCubit({
    required this.choosePatientCubit,
  }) : super(PatientStatus.firstAsk);
  void update(PatientStatus newStatus) {
    emit(newStatus);
  }
}

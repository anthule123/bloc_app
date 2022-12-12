import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/data_providers/home/patient_create.dart';

import '../../../data/models/export.dart';

part 'patient_creation_state.dart';

class PatientCreationCubit extends Cubit<PatientCreationState> {
  PatientCreationCubit() : super(initialPatientCreationState());

  void updateID(String newID) {
    PatientCreationState newState = state.hotClone();
    newState.profile.id = newID;
    emit(newState);
  }

  void updateName(String newName) {
    PatientCreationState newState = state.hotClone();
    newState.profile.name = newName;
    emit(newState);
  }

  void updateWeight(double weight) {
    PatientCreationState newState = state.hotClone();
    newState.profile.weight = weight;
    emit(newState);
  }

  Future<void> sendData() async {
    PatientCreationState newState = state.hotClone();

    newState.dataSending = await createPatient(state.profile);
    emit(newState);
  }
}

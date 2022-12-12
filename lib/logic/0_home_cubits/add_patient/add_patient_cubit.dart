// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/data_providers/patient_create.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/patient.dart';

part 'add_patient_state.dart';

enum DataSending {no_send, sending, success, failure, }

class AddPatientCubit extends Cubit<PatientAddState> {
  PatientAddCubit() : super(PatientAddState(patient: Patient()));

  Future<void> updateName(String newName) async {
    state.patient.name = newName;
    //emit(state);
  }

  Future<void> updateID(String newID) async {
    state.patient.id = newID;
    //emit(state);
  }

  Future<void> sendData() async {
    state.data_sending = await dataSending.sending;
    state.data_sending = await createPatient(state.patient);
    //emit(state);
  }
}

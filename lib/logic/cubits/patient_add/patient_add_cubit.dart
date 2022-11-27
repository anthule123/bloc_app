// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/data_providers/patient_create.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/patient.dart';

part 'patient_add_state.dart';

enum dataSending { no_send, sending, success, failure }

class PatientAddCubit extends Cubit<PatientAddState> {
  PatientAddCubit() : super(PatientAddState(patient: Patient()));

  Future<void> updateName(String newName) async {
    state.patient.name = newName;
    emit(state);
  }

  Future<void> updateID(String newID) async {
    state.patient.id = newID;
    emit(state);
  }

  Future<void> sendData() async {
    state.data_sending = dataSending.sending;
    state.data_sending = await createPatient(state.patient);
    emit(state);
  }
}

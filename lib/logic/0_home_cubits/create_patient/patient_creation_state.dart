// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'patient_creation_cubit.dart';

enum DataSending {
  no_send,
  sending,
  success,
  failure,
}

class PatientCreationState {
  Profile profile;
  DataSending? dataSending;
  PatientCreationState({
    required this.profile,
    this.dataSending = DataSending.no_send,
  });
  PatientCreationState hotClone() {
    return PatientCreationState(
      profile: profile,
      dataSending: dataSending,
    );
  }
}

PatientCreationState initialPatientCreationState() {
  return PatientCreationState(
    profile: Profile(),
  );
}

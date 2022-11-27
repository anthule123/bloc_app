// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'patient_add_cubit.dart';

class PatientAddState extends Equatable {
  Patient patient = Patient();
  dataSending? data_sending;

  PatientAddState({
    required this.patient,
    data_sending = dataSending.no_send,
  });

  @override
  List<Object> get props => [this.patient];
}

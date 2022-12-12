// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/data/models/profile.dart';
import 'package:bloc_app/data/models/regimen.dart';

enum PatientStatus {
  firstAsk,
  noInsulin,
  yesInsulin,
  highInsulin,
  finish,
}

class Patient {
  Profile profile;
  List<Regimen> oldRegimens;
  PatientStatus patientStatus;
  dynamic currentRegimenState;
  Patient({
    required this.profile,
    required this.oldRegimens,
    this.patientStatus = PatientStatus.firstAsk,
  });
}

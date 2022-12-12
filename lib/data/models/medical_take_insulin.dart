// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'medical_action.dart';

enum InsulinType {
  Glargine,
  Actrapid,
  NPH,
}

class MedicalTakeInsulin extends MedicalAction {
  InsulinType insulinType;
  int insulinUI;
  MedicalTakeInsulin({
    required this.insulinType,
    required super.time,
    required this.insulinUI,
  });

  //List<Object?> get props => [this.time, this.insulinType, this.insulinUI];
  MedicalTakeInsulin clone() {
    return MedicalTakeInsulin(
      insulinType: insulinType,
      time: time,
      insulinUI: insulinUI,
    );
  }

  @override
  String toString() {
    return '(${this.insulinUI} ${this.insulinType})';
  }
}

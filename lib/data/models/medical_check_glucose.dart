import 'medical_action.dart';

class MedicalCheckGlucose extends MedicalAction {
  double glucoseUI = 0;
  MedicalCheckGlucose({
    required super.time,
    required this.glucoseUI,
  });
  // @override
  // List<Object?> get props => [this.time, this.glucoseUI];
  MedicalCheckGlucose clone() {
    return MedicalCheckGlucose(time: time, glucoseUI: glucoseUI);
  }

  @override
  String toString() {
    return '($glucoseUI glucose)';
  }
}

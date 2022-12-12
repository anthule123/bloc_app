// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MedicalAction {
  DateTime time;

  MedicalAction({
    required this.time,
  });

  // @override
  // // TODO: implement props
  // List<Object?> get props => [this.time];

  @override
  String toString() {
    return 'MedicalAction [time : ${this.time}]';
  }

  MedicalAction clone() {
    return MedicalAction(time: this.time);
  }
}

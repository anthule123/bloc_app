// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  String id;
  String name;
  Patient({
    this.id = 'Unknown',
    this.name = 'Unknown',
  });
  Patient copy() {
    return Patient(
      id: this.id,
      name: this.name,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.name];
}

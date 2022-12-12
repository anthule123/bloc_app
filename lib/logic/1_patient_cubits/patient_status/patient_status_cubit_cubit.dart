import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_status_cubit_state.dart';

class PatientStatusCubitCubit extends Cubit<PatientStatusCubitState> {
  PatientStatusCubitCubit() : super(PatientStatusCubitInitial());
}

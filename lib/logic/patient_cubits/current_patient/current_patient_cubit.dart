import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_patient_state.dart';

class CurrentPatientCubit extends Cubit<CurrentPatientState> {
  CurrentPatientCubit() : super(CurrentPatientInitial());
}

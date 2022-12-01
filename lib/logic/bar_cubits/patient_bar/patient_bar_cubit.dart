import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_bar_state.dart';

class PatientBarCubit extends Cubit<PatientBarState> {
  PatientBarCubit() : super(PatientBarState());
  void updateIndex(int newIndex) {
    emit(PatientBarState(index: newIndex));
  }
}

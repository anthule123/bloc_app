import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_patient_state.dart';

class ChoosePatientCubit extends Cubit<ChoosePatientState> {
  ChoosePatientCubit() : super(ChoosePatientInitial());
}

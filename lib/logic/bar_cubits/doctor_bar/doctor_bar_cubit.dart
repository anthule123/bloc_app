import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_bar_state.dart';

class DoctorBarCubit extends Cubit<DoctorBarState> {
  DoctorBarCubit() : super(DoctorBarState(index: 0));
  void updateIndex(int newIndex) {
    emit(DoctorBarState(index: newIndex));
  }
}

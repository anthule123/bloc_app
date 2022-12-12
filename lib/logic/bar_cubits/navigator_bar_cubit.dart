import 'package:bloc/bloc.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);
  void update(int index) {
    emit(index);
  }
}

class BottomNavigatorBarCubit extends IndexCubit {}

class PatientNavigatorBarCubit extends IndexCubit {}

class DoctorNavigatorBarCubit extends IndexCubit {}

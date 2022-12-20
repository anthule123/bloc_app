import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_patient_state.dart';


class ProfilePatientCubit extends Cubit<ProfilePatientState> {
  ProfilePatientCubit() : super(ProfilePatientInitial());
  // Tạo hàm update
  void update(String id) {
    emit(ProfilePatientUpdated(id));
  }
  // nhập dữ liệu bệnh nhân từ firebase
  void load(String id) {
    emit(ProfilePatientLoaded(id));
  }
}
// Nhập dữ liệu từ firebase
import 'package:bloc_app/data/models/patient.dart';
import 'package:bloc_app/data/repositories/patient_repository.dart';
import 'package:bloc_app/logic/1_patient_cubits/profile_patient/profile_patient_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePatientBloc extends Bloc<ProfilePatientEvent, ProfilePatientState> {
  ProfilePatientBloc() : super(ProfilePatientInitial());
  final PatientRepository patientRepository = PatientRepository();
  @override
  Stream<ProfilePatientState> mapEventToState(ProfilePatientEvent event) async* {
    if (event is ProfilePatientLoad) {
      yield ProfilePatientLoading();
      try {
        final Patient patient = await patientRepository.getPatient(event.id);
        yield ProfilePatientLoaded(patient);
      } catch (e) {
        yield ProfilePatientError(e.toString());
      }
    }
  }
}
// Tạo hàm load
import 'package:bloc_app/data/models/patient.dart';
import 'package:equatable/equatable.dart';

abstract class ProfilePatientState extends Equatable {
  const ProfilePatientState();
}

class ProfilePatientInitial extends ProfilePatientState {
  @override
  List<Object> get props => [];
}

class ProfilePatientLoading extends ProfilePatientState {
  @override
  List<Object> get props => [];
}

class ProfilePatientLoaded extends ProfilePatientState {
  final Patient patient;
  ProfilePatientLoaded(this.patient);
  @override
  List<Object> get props => [patient];
}

class ProfilePatientError extends ProfilePatientState {
  final String message;
  ProfilePatientError(this.message);
  @override
  List<Object> get props => [message];
}
// Tạo hàm update
import 'package:equatable/equatable.dart';


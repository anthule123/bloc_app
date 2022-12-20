import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_doctor_state.dart';

class ProfileDoctorCubit extends Cubit<ProfileDoctorState> {
  ProfileDoctorCubit() : super(ProfileDoctorInitial());
}

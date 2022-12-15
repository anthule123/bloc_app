// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/1_patient_cubits/yes_insulin/yes_insulin_fast/yes_insulin_fast_cubit.dart';
import 'package:bloc_app/logic/bar_cubits/navigator_bar_cubit.dart';

import 'package:bloc_app/presentation/screens/0_home_screens/create_patient/create_name.dart';
import 'package:bloc_app/presentation/screens/0_home_screens/create_patient/create_id.dart';
import 'package:bloc_app/presentation/screens/0_home_screens/create_patient/final_create.dart';
import 'package:bloc_app/presentation/screens/1_current_patient_screens/patient_history_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/0_home_cubits/create_patient/patient_creation_cubit.dart';
import '../../logic/1_patient_cubits/yes_insulin/yes_insulin_slow/yes_insulin_slow_cubit.dart';
import '../../logic/one_shot_cubits/time_check/time_check_cubit.dart';
import '../screens/0_home_screens/create_patient/create_weight.dart';
import '../screens/1_current_patient_screens/patient_profile_screen.dart';
import '../screens/1_current_patient_screens/patient_main_screen/patient_screen.dart';
import '../screens/2_doctor_screens/doctor_profile_screen.dart';
import '../screens/2_doctor_screens/doctor_screen.dart';
import '../screens/0_home_screens/home_screen.dart';
import '../screens/3_setting_screens/setting_screen.dart';

class AppRouter {
  final PatientCreationCubit _patientAddCubit = PatientCreationCubit();
  final PatientNavigatorBarCubit patientNavigatorBarCubit =
      PatientNavigatorBarCubit();
  final DoctorNavigatorBarCubit doctorNavigatorBarCubit =
      DoctorNavigatorBarCubit();
  final YesInsulinFastCubit yesInsulinFastCubit = YesInsulinFastCubit();
  final YesInsulinSlowCubit yesInsulinSlowCubit = YesInsulinSlowCubit();
//final NoInsulinCubit noInsulinCubit = NoInsulinCubit();
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
//home
      case ('/'):
        {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(
              title: 'Trang chủ',
              color: Colors.blue.shade700,
            ),
          );
        }
      case ('/profileMaking'):
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _patientAddCubit,
              child: PatientProfileMaking(),
            ),
          );
        }
      case ('/profileMakingWeight'):
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _patientAddCubit,
              child: PatientProfileMakingWeight(),
            ),
          );
        }
      case ('/profileMakingID'):
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _patientAddCubit,
              child: PatientProfileMakingID(),
            ),
          );
        }
      case ('/profileMakingFinal'):
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: _patientAddCubit,
              child: FinalCreatePatient(),
            ),
          );
        }
//patient
      case ('/patient'):
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: patientNavigatorBarCubit,
            child: BlocProvider<TimeCheckCubit>(
              create: (context) => TimeCheckCubit(ticker: secondStream()),
              child: BlocProvider.value(
                value: yesInsulinFastCubit,
                child: BlocProvider.value(
                  value: yesInsulinSlowCubit,
                  child: PatientScreen(),
                ),
              ),
            ),
          ),
        );

      case ('/patient/profile'):
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: patientNavigatorBarCubit,
            child: PatientProfileScreen(),
          ),
        );
      case ('/patient/history'):
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: patientNavigatorBarCubit,
            child: PatientHistoryScreen(),
          ),
        );
//Doctor
      case ('/doctor'):
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: doctorNavigatorBarCubit,
            child: DoctorScreen(),
          ),
        );
      case ('/doctor/profile'):
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: doctorNavigatorBarCubit,
            child: DoctorProfileScreen(),
          ),
        );
//settings
      case ('/settings'):
        return MaterialPageRoute(
          builder: (context) => SettingScreen(),
        );
      default:
        return null;
    }
  }
}

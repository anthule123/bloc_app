// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/cubits/patient_add/patient_add_cubit.dart';
import 'package:bloc_app/logic/no_insulin_cubits/no_insulin_cubit.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/create_name.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/create_id.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/final_create.dart';
import 'package:bloc_app/presentation/screens/current_patient_screens/patient_history_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bar_cubits/patient_bar/patient_bar_cubit.dart';
import '../screens/current_patient_screens/patient_profile_screen.dart';
import '../screens/current_patient_screens/patient_screen.dart';
import '../screens/doctor_screens/doctor_profile_screen.dart';
import '../screens/doctor_screens/doctor_screen.dart';
import '../screens/home_screen.dart';
import '../screens/setting_screens/setting_screen.dart';

class AppRouter {
  final PatientAddCubit _patientAddCubit = PatientAddCubit();
  final PatientBarCubit _patientBarCubit = PatientBarCubit();
  //final NoInsulinCubit noInsulinCubit = NoInsulinCubit();
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
      case ('/doctor'):
        return MaterialPageRoute(
          builder: (context) => DoctorScreen(),
        );
      case ('/patient'):
        return MaterialPageRoute(
          builder: (context) => PatientScreen(),
        );
      case ('/setting'):
        return MaterialPageRoute(
          builder: (context) => SettingScreen(),
        );
      case ('/patient/profile'):
        return MaterialPageRoute(
          builder: (context) => PatientProfileScreen(),
        );
      case ('/patient/history'):
        return MaterialPageRoute(
          builder: (context) => PatientHistoryScreen(),
        );
      case ('/doctor/profile'):
        return MaterialPageRoute(
          builder: (context) => DoctorProfileScreen(),
        );
      default:
        return null;
    }
  }
}

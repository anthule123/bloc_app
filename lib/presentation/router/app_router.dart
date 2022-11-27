// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app/logic/cubits/patient_add/patient_add_cubit.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/create_name.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/create_id.dart';
import 'package:bloc_app/presentation/screens/create_patient_profile/final_create.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_screen.dart';

class AppRouter {
  final PatientAddCubit _patientAddCubit = PatientAddCubit();
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ('/'):
        {
          return MaterialPageRoute(
            builder: (_) => HomeScreen(
              title: 'Home Screen',
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
      default:
        return null;
    }
  }
}

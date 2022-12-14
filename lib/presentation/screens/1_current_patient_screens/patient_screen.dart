import 'package:bloc_app/data/models/time_controller.dart/sonde_range.dart';
import 'package:bloc_app/logic/one_shot_cubits/time_check/time_check_cubit.dart';
import 'package:bloc_app/presentation/screens/1_current_patient_screens/no_insulin/guide_insulin.dart';
import 'package:bloc_app/presentation/screens/1_current_patient_screens/no_insulin/input_glucose.dart';
import 'package:bloc_app/presentation/widgets/buttons/grey_next_button.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/presentation/widgets/bars/bottom_navitgator_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../data/models/patient.dart';
import '../../../logic/1_patient_cubits/no_insulin/no_insulin_cubit.dart';
import '../../../logic/1_patient_cubits/patient_status/patient_status_cubit.dart';
import '../../../logic/blocs/timer_bloc.dart';
import '../../../logic/models/ticker.dart';
import '../../widgets/bars/patient_navigator_bar.dart';
import 'no_insulin/input_cho.dart';
import 'no_insulin/no_insulin_case_representation.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: PatientNavigatorBar(),
      ),
      body: Column(
        children: [
          DoctorImage(),
          TestTime(),
          BlocBuilder<TimerBloc, TimerState>(
            builder: ((context, state) {
              if (inSondeRange(DateTime.now()))
                return Column(
                  children: [
                    Text('Đến giờ đo'),
                    SondeTreatment(),
                  ],
                );
              else
                return Text('Chưa đến giờ đo');
            }),
          ),
        ],
      ),
      // body: top_navigation_bar_patient(),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}

class DoctorImage extends StatelessWidget {
  const DoctorImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                // width: widthDevideMethod(0.1),
                // height: heightDevideMethod(0.372),
              ),
              SizedBox(
                  // width: widthDevideMethod(0.7),
                  child: Image.asset("assets/images/doctor.jpg",
                      height: 200, width: 200, fit: BoxFit.fitHeight)),
              Expanded(
                  child: Container(
                      //  height:
                      //   heightDevideMethod(0.372),
                      color: const Color(0xfff5f6f6))),
              ResetPatientStatusButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class ResetPatientStatusButton extends StatelessWidget {
  const ResetPatientStatusButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<PatientStatusCubit>().update(PatientStatus.firstAsk);
        },
        icon: Icon(Icons.restart_alt_outlined));
  }
}

class SondeTreatment extends StatelessWidget {
  const SondeTreatment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientStatusCubit, PatientStatus>(
      builder: (context, state) {
        if (state == PatientStatus.firstAsk) {
          return Column(
            children: [
              Text('Bn có tiêm insulin ko?'),
              TextButton(
                onPressed: () {
                  context
                      .read<PatientStatusCubit>()
                      .update(PatientStatus.yesInsulin);
                },
                child: Text('có'),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<PatientStatusCubit>()
                      .update(PatientStatus.noInsulin);
                },
                child: Text('không'),
              ),
            ],
          );
        } else if (state == PatientStatus.noInsulin)
          return NoInsulinRepresentation();
        else
          return Column();
      },
    );
  }
}

class TestTime extends StatelessWidget {
  const TestTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
      return Row(
        children: [
          if (state is TimerInitial) ...[
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),

              /// changes from current state to TimerStarted state
              onPressed: () =>
                  context.read<TimerBloc>().add(TimerStarted(state.duration)),
            ),
          ],
          if (inSondeRange(DateTime.now())) ...[Text('OK Time')],
          if (!inSondeRange(DateTime.now())) ...[Text('chưa đến giờ')],
          Text('${DateTime.now()}'),
        ],
      );
    });
  }
}

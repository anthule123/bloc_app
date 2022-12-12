// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:bloc_app/data/data_providers/home/check_existed_id.dart';

class ChoosePatientCubit extends Cubit<String> {
  ChoosePatientCubit() : super('Unknown');
  void update(String newString) {
    emit(newString);
  }
}

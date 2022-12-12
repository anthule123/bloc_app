import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class StringCubit extends Cubit<String> {
  StringCubit() : super('');
  void update(String newString) {
    emit(newString);
  }
}

class TextFormCubit extends StringCubit {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'text_form_state.dart';

class TextFormCubit extends Cubit<TextFormState> {
  TextFormCubit() : super(TextFormInitial()) {}
  void update(String text) {
    emit(TextFormState(text: text));
  }
}

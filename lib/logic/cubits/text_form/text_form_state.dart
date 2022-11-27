part of 'text_form_cubit.dart';

class TextFormState extends Equatable {
  final String text;
  const TextFormState({required this.text});

  @override
  List<Object> get props => [
        this.text,
      ];
}

class TextFormInitial extends TextFormState {
  TextFormInitial({super.text = ''});
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum YesInsulinSlowStatus {
  askType,
  NPH,
  Glargine,
}

class YesInsulinSlowCubit extends Cubit<YesInsulinSlowStatus> {
  YesInsulinSlowCubit() : super(YesInsulinSlowStatus.askType);
  void update(YesInsulinSlowStatus status) {
    emit(status);
  }
}

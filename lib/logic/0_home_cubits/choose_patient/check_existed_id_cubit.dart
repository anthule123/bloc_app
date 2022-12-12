import 'package:bloc_app/data/data_providers/home/check_existed_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckExistedIDCubit extends Cubit<bool> {
  CheckExistedIDCubit() : super(false);

  void check(String id) async {
    bool ans = await checkExistedID(id);
    emit(ans);
  }
}

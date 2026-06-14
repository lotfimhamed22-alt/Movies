import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/services/auth_services.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());
  Future<void> resetPassword({required String email}) async {
    emit(ForgetPassLoading());
    try {
      await authServices.value.resetPassword(email: email);
      emit(ForgetPassSuccess());
    } catch (e) {
      emit(ForgetPassFailure(errorMessage: e.toString()));
    }
  }
}

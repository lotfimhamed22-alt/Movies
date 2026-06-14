import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/services/auth_services.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup({required String email, required String password}) async {
    emit(SignupLoading());
    try {
      await authServices.value.createAccount(email: email, password: password);
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(messageError: e.toString()));
    }
  }
}

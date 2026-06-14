import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/services/auth_services.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  Future<void> signin({required String email, required String password}) async {
    emit(SigninLoading());
    try {
      await authServices.value.signIn(email: email, password: password);
      emit(SigninSuccess());
    } catch (e) {
      emit(SigninFailure(errorMessage: e.toString()));
    }
  }
}

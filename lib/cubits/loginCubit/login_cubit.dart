import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errorMessage: 'user not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(errorMessage: 'wrong password'));
      }
    } catch (e) {
      emit(LoginFailureState(errorMessage: 'there is an error'));
    }
  }
}

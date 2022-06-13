import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.unauthenticated());

  void logInSuccessfully() {
    emit(const AuthState.authenticated());
  }

  void logOut() {
    emit(const AuthState.unauthenticated());
  }
}

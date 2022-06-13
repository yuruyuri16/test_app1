part of 'auth_cubit.dart';

enum AuthStatus {
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == AuthStatus.authenticated;
}

class AuthState extends Equatable {
  const AuthState._(this.status);
  const AuthState.authenticated() : this._(AuthStatus.authenticated);
  const AuthState.unauthenticated() : this._(AuthStatus.unauthenticated);

  final AuthStatus status;

  @override
  List<Object> get props => [status];
}

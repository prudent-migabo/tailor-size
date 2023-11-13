part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  submitting,
  submitted,
  error
}

class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [authStatus, error];

  AuthStatus authStatus;
  String error;

//<editor-fold desc="Data Methods">
  AuthState({
    required this.authStatus,
    required this.error,
  });


  AuthState copyWith({
    AuthStatus? authStatus,
    String? error,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      error: error ?? this.error,
    );
  }


  factory AuthState.initial() {
    return AuthState(
      authStatus: AuthStatus.initial,
      error: '',
    );
  }

}

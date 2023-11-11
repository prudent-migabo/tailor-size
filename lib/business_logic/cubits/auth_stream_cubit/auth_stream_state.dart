
import 'package:equatable/equatable.dart';

enum UserAuthStatus{
  unauthenticated,
  authenticated
}

class AuthStreamState extends Equatable{
  @override
  List<Object?> get props => [userAuthStatus];

  UserAuthStatus userAuthStatus;

  AuthStreamState({
    required this.userAuthStatus,
  });


  AuthStreamState copyWith({
    UserAuthStatus? userAuthStatus,
  }) {
    return AuthStreamState(
      userAuthStatus: userAuthStatus ?? this.userAuthStatus,
    );
  }


  factory AuthStreamState.initial() {
    return AuthStreamState(
      userAuthStatus: UserAuthStatus.unauthenticated,
    );
  }

//</editor-fold>
}


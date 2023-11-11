import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:tailor_size/data/data.dart';

import 'auth_stream_state.dart';

part 'auth_stream_state.dart';

class AuthStreamCubit extends Cubit<AuthStreamState> {
  AuthStreamCubit() : super(AuthStreamInitial());

  StreamSubscription? subscription;

  StreamSubscription<User?> monitorAuthStreamCubit (){
    return subscription = AuthRepository().user.listen((user) {
      onUserStatusChanged(user);
    });
  }

  void onUserStatusChanged (User? user) {
    if (user != null) {
      emit(state.copyWith(userAuthStatus: UserAuthStatus.authenticated));
    } else {
      emit(state.copyWith(userAuthStatus: UserAuthStatus.unauthenticated));
    }
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }

}

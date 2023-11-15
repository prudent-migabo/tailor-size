import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/utils/utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  Future<void> createUser ({required String email, required String password}) async{
    try{
      emit(state.copyWith(authStatus: AuthStatus.submitting));
      await AuthRepository().createUser(email: email, password: password);
      emit(state.copyWith(authStatus: AuthStatus.submitted));
    } on FirebaseAuthException catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }
    catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }


  Future<void> loginUser ({required String email, required String password}) async{
    try{
      emit(state.copyWith(authStatus: AuthStatus.submitting));
      await AuthRepository().loginUser(email: email, password: password);
      emit(state.copyWith(authStatus: AuthStatus.submitted));
    } on FirebaseAuthException catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }
    catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }


  Future<void> signInUserWithWithGoogle () async{
    try {
      emit(state.copyWith(authStatus: AuthStatus.submitting));
      await AuthRepository().signInWithGoogle();
      emit(state.copyWith(authStatus: AuthStatus.submitted));
    } on FirebaseAuthException catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }
    catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }


  Future<void> signOutUser () async{
    try {
      emit(state.copyWith(authStatus: AuthStatus.submitting));
      await AuthRepository().signOutUser();
      emit(state.copyWith(authStatus: AuthStatus.submitted));
    } on FirebaseAuthException catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: AuthExceptionHandler.generateExceptionMessage(e.code)));
    }
    catch (e){
      emit(state.copyWith(authStatus: AuthStatus.error, error: e.toString()));
    }
  }


}

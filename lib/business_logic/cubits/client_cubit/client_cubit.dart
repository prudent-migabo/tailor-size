import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/statics/statics.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientState.initial()){
    listClients();
  }

  StreamSubscription? subscription;

  StreamSubscription<List<ClientModel>> listClients (){
    return subscription = ClientRepository().listClients().listen((event) {
      emit(state.copyWith(clients: event));
    });
  }

  Future<void> createClient (ClientModel clientModel) async{
    try{
      emit(state.copyWith(clientStatus: ClientStatus.submitting),);
      await ClientRepository().createClient(clientModel.toMap());
      emit(state.copyWith(clientStatus: ClientStatus.submitted),);
    } catch (e){
      emit(state.copyWith(clientStatus: ClientStatus.error, error: errorMessage),);
    }
  }

  Future<void> updateClient ({required ClientModel clientModel, required String clientID}) async{
    try{
      emit(state.copyWith(clientStatus: ClientStatus.submitting),);
      await ClientRepository().updateClient(data: clientModel.toMap(), clientID: clientID);
      emit(state.copyWith(clientStatus: ClientStatus.submitted),);
    } catch (e){
      emit(state.copyWith(clientStatus: ClientStatus.error, error: errorMessage),);
    }
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }

}

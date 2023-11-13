import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tailor_size/data/data.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientState.initial());

  Future<void> createClient (ClientModel clientModel) async{
    try{
      emit(state.copyWith(clientStatus: ClientStatus.submitting),);
      await ClientRepository().createClient(clientModel.toMap());
      emit(state.copyWith(clientStatus: ClientStatus.submitted),);
    } catch (e){
      emit(state.copyWith(clientStatus: ClientStatus.error, error: e.toString()),);
    }
  }

}

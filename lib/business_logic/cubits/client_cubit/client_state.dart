part of 'client_cubit.dart';

enum ClientStatus {
  initial,
  submitting,
  submitted,
  error
}

class ClientState extends Equatable {
  @override
  List<Object?> get props => [clientStatus, error, clients];

  ClientStatus clientStatus;
  String error;
  List<ClientModel> clients;

//<editor-fold desc="Data Methods">
  ClientState({
    required this.clientStatus,
    required this.error,
    required this.clients,
  });


  ClientState copyWith({
    ClientStatus? clientStatus,
    String? error,
    List<ClientModel>? clients,
  }) {
    return ClientState(
      clientStatus: clientStatus ?? this.clientStatus,
      error: error ?? this.error,
      clients: clients ?? this.clients,
    );
  }


  factory ClientState.initial() {
    return ClientState(
      clientStatus: ClientStatus.initial,
      error: '',
      clients: const [],
    );
  }

}

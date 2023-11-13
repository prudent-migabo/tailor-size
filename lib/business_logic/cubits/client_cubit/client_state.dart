part of 'client_cubit.dart';

enum ClientStatus {
  initial,
  submitting,
  submitted,
  error
}

class ClientState extends Equatable {
  @override
  List<Object?> get props => [clientStatus, error];

  ClientStatus clientStatus;
  String error;

//<editor-fold desc="Data Methods">
  ClientState({
    required this.clientStatus,
    required this.error,
  });


  ClientState copyWith({
    ClientStatus? clientStatus,
    String? error,
  }) {
    return ClientState(
      clientStatus: clientStatus ?? this.clientStatus,
      error: error ?? this.error,
    );
  }


  factory ClientState.initial() {
    return ClientState(
      clientStatus: ClientStatus.initial,
      error: '',
    );
  }

}

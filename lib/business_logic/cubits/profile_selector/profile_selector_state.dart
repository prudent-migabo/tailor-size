part of 'profile_selector_cubit.dart';

enum SelectorStatus {
  initial,
  shoulder,
  belly,
  bust,
}

class ProfileSelectorState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [selectorStatus, index];

  SelectorStatus selectorStatus;
  int index;

//<editor-fold desc="Data Methods">
  ProfileSelectorState({
    required this.selectorStatus,
    required this.index,
  });


  ProfileSelectorState copyWith({
    SelectorStatus? selectorStatus,
    int? index,
  }) {
    return ProfileSelectorState(
      selectorStatus: selectorStatus ?? this.selectorStatus,
      index: index ?? this.index,

    );
  }


  factory ProfileSelectorState.initial() {
    return ProfileSelectorState(
      selectorStatus: SelectorStatus.initial,
      index: 0,
    );
  }

//</editor-fold>
}

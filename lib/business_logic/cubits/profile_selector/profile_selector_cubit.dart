import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'profile_selector_state.dart';


class SelectShoulderCubit extends Cubit<int> {
  SelectShoulderCubit() : super(0);

  void selectShoulder(int index) {
    switch (index) {
      case 1:
        emit(1);
      case 2:
        emit(2);
      case 3:
        emit(3);
      default:
        emit(0);
    }
  }

  void initial(){
    emit(0);
  }
}

class SelectBellyCubit extends Cubit<int> {
  SelectBellyCubit() : super(0);

  void selectBelly(int index) {
    switch (index) {
      case 1:
        emit(1);
      case 2:
        emit(2);
      case 3:
        emit(3);
      default:
        emit(0);
    }
  }

  void initial(){
    emit(0);
  }
}


class SelectBustCubit extends Cubit<int> {
  SelectBustCubit() : super(0);

  void selectBust(int index) {
    switch (index) {
      case 1:
        emit(1);
      case 2:
        emit(2);
      case 3:
        emit(3);
      default:
        emit(0);
    }
  }

  void initial(){
    emit(0);
  }
}



// class ProfileSelectorCubit extends Cubit<ProfileSelectorState> {
//   ProfileSelectorCubit() : super(ProfileSelectorState.initial());
//
//   void selectShoulder(int index){
//     switch(index){
//       case 1:
//         emit(state.copyWith(selectorStatus: SelectorStatus.shoulder, index: index));
//       case 2:
//         print('##############$index');
//         emit(state.copyWith(selectorStatus: SelectorStatus.shoulder, index: index));
//       case 3:
//         emit(state.copyWith(selectorStatus: SelectorStatus.shoulder, index: index));
//         default:
//           emit(state.copyWith(selectorStatus: SelectorStatus.initial, index: 0));
//     }
//   }
//
//   void selectBelly(int index){
//     switch(index){
//       case 1:
//         emit(state.copyWith(selectorStatus: SelectorStatus.belly, index: index));
//       case 2:
//         emit(state.copyWith(selectorStatus: SelectorStatus.belly, index: index));
//       case 3:
//         emit(state.copyWith(selectorStatus: SelectorStatus.belly, index: index));
//       default:
//         emit(state.copyWith(selectorStatus: SelectorStatus.initial, index: 0));
//     }
//   }
//
//   void selectBust(int index){
//     switch(index){
//       case 1:
//         emit(state.copyWith(selectorStatus: SelectorStatus.bust, index: 1));
//       case 2:
//         emit(state.copyWith(selectorStatus: SelectorStatus.bust, index: 2));
//       case 3:
//         emit(state.copyWith(selectorStatus: SelectorStatus.bust, index: 3));
//       default:
//         emit(state.copyWith(selectorStatus: SelectorStatus.initial, index: 0));
//     }
//   }
//
// }

import 'package:bloc/bloc.dart';
import 'package:fire_walker/domain/usecases/auth_usecase.dart';

class FriendsPopupCubit extends Cubit<String?> {
  final AuthUsecase _authUsecase;

  FriendsPopupCubit(this._authUsecase) : super(null);

  void updateNickname(String nickname) {
    emit(nickname);
  }

  Future<void> submitFriendRequest() async {
    if (state != null && state!.isNotEmpty) {
      await _authUsecase.requestFriend(state!);
      emit(null); // 상태 초기화
    }
  }

  void clearNickname() {
    emit(null);
  }
}

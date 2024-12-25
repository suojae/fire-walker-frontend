import 'package:fire_walker/domain/auth_repository_interface.dart';

import '../entities/user_entity.dart';

enum SignInResult {
  success,
  tokenExpired,
  error,
}

final class AuthUsecase {
  final IAuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<UserEntity> getCurrentUser() async {
    return await _authRepository.getCurrentUser();
  }

  Future<void> signUp(String socialId) async {
    await _authRepository.signUp(socialId);
  }

  Future<SignInResult> signIn() {
    return _authRepository.signIn();
  }

  Future<void> signOut() {
    return _authRepository.signout();
  }

  Future<void> deleteAccount() {
    return _authRepository.deleteAccount();
  }

  Future<void> updateUserInfo({
    required String userUuid,
    String? nickName,
    String? fcmToken,
    int? dailyTargetStep,
  }) async {
    await _authRepository.updateUserInfo(
      userUuid: userUuid,
      nickName: nickName,
      fcmToken: fcmToken,
      dailyTargetStep: dailyTargetStep,
    );
  }
}

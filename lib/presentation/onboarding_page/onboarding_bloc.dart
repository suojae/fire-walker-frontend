import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di_container.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';
import '../../domain/usecases/auth_usecase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AuthUsecase _authUsecase = getIt<AuthUsecase>();

  String? nickname;
  int? stepGoal;

  OnboardingBloc() : super(const OnboardingState.initial()) {
    on<OnboardingEvent>((event, emit) async {
      await event.when(
        submitNickname: (nickname) async {
          this.nickname = nickname;
          emit(OnboardingState.nicknameSubmitted(nickname));
        },
        submitStepGoal: (stepGoal) async {
          this.stepGoal = stepGoal;
          emit(OnboardingState.stepGoalSubmitted(stepGoal));
        },
        completeOnboarding: () async {
          if (nickname != null && stepGoal != null) {
            // 현재 유저 정보 가져오기
            final currentUser = await _authUsecase.getCurrentUser();

            // FCM 토큰 생성
            final fcmToken = await FirebaseMessaging.instance.getToken();

            await _authUsecase.updateUserInfo(
              userUuid: currentUser.uuid,
              nickName: nickname,
              fcmToken: fcmToken,
              dailyTargetStep: stepGoal,
            );

            emit(const OnboardingState.completed());
          } else {
            throw Exception('닉네임과 목표 걸음수가 설정되지 않았습니다.');
          }
        },
      );
    });
  }
}

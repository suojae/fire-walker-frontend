import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = OnboardingInitial;
  const factory OnboardingState.nicknameSubmitted(String nickname) = NicknameSubmitted;
  const factory OnboardingState.stepGoalSubmitted(int stepGoal) = StepGoalSubmitted;
  const factory OnboardingState.completed() = OnboardingCompleted;
}

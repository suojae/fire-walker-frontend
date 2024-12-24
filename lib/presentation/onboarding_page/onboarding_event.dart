import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.submitNickname(String nickname) = SubmitNickname;
  const factory OnboardingEvent.submitStepGoal(int stepGoal) = SubmitStepGoal;
  const factory OnboardingEvent.completeOnboarding() = CompleteOnboarding;
}

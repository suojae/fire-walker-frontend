import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/step_entity.dart';

part 'step_state.freezed.dart';

@freezed
class StepsState with _$StepsState {
  const factory StepsState.initial() = StepInitial;

  const factory StepsState.loadingLocal() = StepLoadingLocal;

  const factory StepsState.loaded({
    required List<StepEntity> steps,
    required StepEntity myStep,
    required bool dailyTargetReached,
    @Default(false) bool isServerLoading,
  }) = StepLoaded;

  const factory StepsState.error({
    required String message,
    @Default(false) bool isLocalError,
    @Default(false) bool isServerError,
  }) = StepError;
}

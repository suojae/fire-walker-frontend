import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_event.freezed.dart';

@freezed
class StepEvent with _$StepEvent {
  /// 랭킹 데이터를 가져오는 이벤트
  const factory StepEvent.fetchSteps({
    required String userId,
    required List<String> friendIds,
    required String date,
    required int dailyTargetSteps,
  }) = FetchSteps;

  /// 데일리 목표 걸음수 도달 여부 확인 이벤트
  const factory StepEvent.checkDailyTarget({
    required String userId,
    required int dailyTargetSteps,
  }) = CheckDailyTarget;

  /// 로컬 걸음수 업데이트 이벤트
  const factory StepEvent.updateLocalSteps({
    required int steps,
    required int dailyTargetSteps,
  }) = UpdateLocalSteps;
}

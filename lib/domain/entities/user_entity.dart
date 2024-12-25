import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uuid,
    required String socialId,
    required String nickName,
    required List<String> friendUuids,
    required int dailyTargetSteps,
    String? fcmToken,
  }) = _User;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

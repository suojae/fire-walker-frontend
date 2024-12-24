import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_info_request_dto.freezed.dart';
part 'update_user_info_request_dto.g.dart';

@freezed
class UpdateUserInfoRequestDto with _$UpdateUserInfoRequestDto {
  const factory UpdateUserInfoRequestDto({
    required String userUuid,
    String? nickName,
    String? fcmToken,
    int? dailyTargetStep,
  }) = _UpdateUserInfoRequestDto;

  factory UpdateUserInfoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestDtoFromJson(json);
}

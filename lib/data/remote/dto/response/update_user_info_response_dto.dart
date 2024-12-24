import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_info_response_dto.freezed.dart';
part 'update_user_info_response_dto.g.dart';

@freezed
class UpdateUserInfoResponseDto with _$UpdateUserInfoResponseDto {
  const factory UpdateUserInfoResponseDto({
    required String message,
  }) = _UpdateUserInfoResponseDto;

  factory UpdateUserInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoResponseDtoFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_nickname_response_dto.freezed.dart';
part 'update_nickname_response_dto.g.dart';

@freezed
class UpdateNicknameResponseDto with _$UpdateNicknameResponseDto {
  const factory UpdateNicknameResponseDto({
    required String message,
  }) = _UpdateNicknameResponseDto;

  factory UpdateNicknameResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateNicknameResponseDtoFromJson(json);
}

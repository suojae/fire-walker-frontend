import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response_dto.freezed.dart';
part 'sign_in_response_dto.g.dart';

@freezed
class SignInResponseDto with _$SignInResponseDto {
  const factory SignInResponseDto({
    required String message,
  }) = _SignInResponseDto;

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);
}

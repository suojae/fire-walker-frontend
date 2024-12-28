import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_dto.freezed.dart';
part 'sign_up_request_dto.g.dart';

@freezed
class SignUpRequestDto with _$SignUpRequestDto {
  const factory SignUpRequestDto({
    required String socialId,
  }) = _SignUpRequestDto;

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);
}

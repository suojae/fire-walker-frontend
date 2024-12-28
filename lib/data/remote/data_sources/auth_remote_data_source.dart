import 'package:dio/dio.dart';
import 'package:fire_walker/data/remote/http/dio_client.dart';

// Freezed Request DTO
import '../dto/request/sign_up_request_dto.dart';
import '../dto/request/refresh_request_dto.dart';
import '../dto/request/sign_in_request_dto.dart';
import '../dto/request/friend_request_request_dto.dart';
import '../dto/request/friend_accept_request_dto.dart';

// Freezed Response DTO
import '../dto/request/update_user_info_request_dto.dart';
import '../dto/response/sign_up_response_dto.dart';
import '../dto/response/sign_in_response_dto.dart';
import '../dto/response/refresh_response_dto.dart';
import '../dto/response/friend_request_response_dto.dart';
import '../dto/response/friend_accept_response_dto.dart';
import '../dto/response/friend_list_response_dto.dart';
import '../dto/response/sign_out_response_dto.dart';
import '../dto/response/update_user_info_response_dto.dart';

/// AuthRemoteDataSource
/// - 서버에 socialId 전송 -> 서버가 카카오/애플 토큰 교환
/// - RTR: refreshToken -> 새 토큰
/// - 로그아웃/탈퇴도 서버가 소셜 AccessToken/세션 관리
final class AuthRemoteDataSource {
  final DioClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  // // -------------------------------------------------
  // [1] 카카오/애플 회원가입
  // -------------------------------------------------
  Future<SignUpResponseDto> signUp(SignUpRequestDto dto) async {
    print("${dto.socialId} 소셜아이디 제대로 가고 있는지 테스트");
    final response = await _apiClient.post(
      '/auth/signup',
      data: dto.toJson(),
    );

    // 헤더에서 토큰 읽기
    final accessToken = response.headers['authorization']!.first;
    final refreshToken = response.headers['x-refresh-token']!.first;

    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');

    return SignUpResponseDto(message: "회원가입 성공!", accessToken: accessToken, refreshToken: refreshToken);
  }

  // -------------------------------------------------
  // [2] 로그인 (Access Token 검증)
  //     프론트에서 로컬에 남아있는 서버 AccessToken 전송
  // -------------------------------------------------
  Future<SignInResponseDto> signIn(SignInRequestDto dto) async {
    final accessToken = dto.accessToken;
    final response = await _apiClient.post(
      '/auth/signin',
      data: dto.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    return SignInResponseDto.fromJson(response.data as Map<String, dynamic>);

  }

  // -------------------------------------------------
  // [3] Refresh Token Rotation
  // -------------------------------------------------
  Future<RefreshResponseDto> refresh(RefreshRequestDto dto) async {
    final response = await _apiClient.post(
      '/auth/refresh',
      data: dto.toJson(),
    );
    return RefreshResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  // -------------------------------------------------
  // [4] 로그아웃/탈퇴
  //     여기서는 백엔드가 소셜토큰을 저장/관리하므로
  //     프론트는 단순 POST 요청만
  // -------------------------------------------------
  Future<SignOutResponseDto> signout() async {
    final response = await _apiClient.post('/auth/signout');
    return SignOutResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SignOutResponseDto> deleteAccount() async {
    final response = await _apiClient.post('/auth/delete');
    return SignOutResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  // -------------------------------------------------
  // [5] 친구 요청/수락
  // -------------------------------------------------
  Future<FriendRequestResponseDto> friendRequest(FriendRequestDto dto) async {
    print("여기가 문제인가 ${dto}");
    final response = await _apiClient.post(
      '/auth/friend/request',
      data: dto.toJson(),
    );
    return FriendRequestResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<FriendAcceptResponseDto> friendAccept(FriendAcceptDto dto) async {
    final response = await _apiClient.post(
      '/auth/friend/accept',
      data: dto.toJson(),
    );
    return FriendAcceptResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  // -------------------------------------------------
  // [6] 친구 목록 조회
  // -------------------------------------------------
  Future<FriendListResponseDto> getFriendList(String nickname) async {
    final response = await _apiClient.get('/auth/friend/list');
    return FriendListResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  // -------------------------------------------------
  // [7] 유저 정보 업데이트
  // -------------------------------------------------
  Future<UpdateUserInfoResponseDto> updateUserInfo(UpdateUserInfoRequestDto dto) async {
    final response = await _apiClient.put(
      '/auth/update',
      data: dto.toJson(),
    );

    return UpdateUserInfoResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}

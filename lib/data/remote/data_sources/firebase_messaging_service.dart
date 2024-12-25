import '../dto/request/friend_accept_request_dto.dart';
import '../dto/request/friend_request_request_dto.dart';
import '../dto/request/update_user_info_request_dto.dart';
import '../dto/response/friend_accept_response_dto.dart';
import '../dto/response/friend_request_response_dto.dart';
import '../dto/response/update_user_info_response_dto.dart';
import '../http/dio_client.dart';

final class FirebaseMessagingService {
  final DioClient _dioClient;

  FirebaseMessagingService(this._dioClient);

  Future<UpdateUserInfoResponseDto?> updateFcmToken(UpdateUserInfoRequestDto requestDto) async {
    try {
      final response = await _dioClient.put(
        '/auth/fcm-token',
        data: requestDto.toJson(),
      );
      print('FCM Token updated successfully.');
      return UpdateUserInfoResponseDto.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      print('Error updating FCM Token: $e');
      return null;
    }
  }

  // 친구 요청 알림 전송
  Future<FriendRequestResponseDto?> sendFriendRequest(
      FriendRequestDto requestDto) async {
    try {
      final response = await _dioClient.post(
        '/auth/friend/request',
        data: requestDto.toJson(),
      );
      print('Friend request sent successfully.');
      return FriendRequestResponseDto.fromJson(response.data);
    } catch (e) {
      print('Error sending friend request: $e');
      return null;
    }
  }

  // 친구 요청 수락 알림 전송
  Future<FriendAcceptResponseDto?> acceptFriendRequest(
      FriendAcceptDto requestDto) async {
    try {
      final response = await _dioClient.post(
        '/auth/friend/accept',
        data: requestDto.toJson(),
      );
      print('Friend request accepted successfully.');
      return FriendAcceptResponseDto.fromJson(response.data);
    } catch (e) {
      print('Error accepting friend request: $e');
      return null;
    }
  }
}

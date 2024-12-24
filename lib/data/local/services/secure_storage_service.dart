import 'dart:convert';

import 'package:fire_walker/data/local/services/user_dao.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final class SecureStorageService {
  final FlutterSecureStorage _secureStorage;

  SecureStorageService() : _secureStorage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDaoKey = 'user_dao';

  /// AccessToken 저장 (유효성 검사 후)
  Future<void> saveAccessToken(String token) async {
    if (JwtDecoder.isExpired(token)) {
      throw Exception("Access token is expired");
    }
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  /// RefreshToken 저장 (유효성 검사 후)
  Future<void> saveRefreshToken(String token) async {
    if (JwtDecoder.isExpired(token)) {
      throw Exception("Refresh token is expired");
    }
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  /// 만료 여부 검사 후 AccessToken 읽기
  Future<String?> getAccessToken() async {
    final token = await _secureStorage.read(key: _accessTokenKey);
    if (token != null && JwtDecoder.isExpired(token)) {
      await _secureStorage.delete(key: _accessTokenKey);
      return null;
    }
    return token;
  }

  /// 만료 여부 검사 후 RefreshToken 읽기
  Future<String?> getRefreshToken() async {
    final token = await _secureStorage.read(key: _refreshTokenKey);
    if (token != null && JwtDecoder.isExpired(token)) {
      await _secureStorage.delete(key: _refreshTokenKey);
      return null;
    }
    return token;
  }

  /// 두 토큰 모두 제거
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  /// (옵션) 특정 토큰만 삭제
  Future<void> deleteAccessToken() async {
    await _secureStorage.delete(key: _accessTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: _refreshTokenKey);
  }


  /// UserDao 저장
  Future<void> saveUserDao(UserDao userDao) async {
    final userJson = jsonEncode(userDao.toJson());
    await _secureStorage.write(key: _userDaoKey, value: userJson);
  }

  /// UserDao 읽기
  Future<UserDao?> getUserDao() async {
    final userJson = await _secureStorage.read(key: _userDaoKey);
    if (userJson == null) return null;

    try {
      final Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserDao.fromJson(userMap);
    } catch (e) {
      print('Failed to parse UserDao: $e');
      return null;
    }
  }

  /// UserDao 업데이트
  Future<void> updateUserDao(Map<String, dynamic> updates) async {
    final existingUserJson = await _secureStorage.read(key: _userDaoKey);
    if (existingUserJson == null) {
      throw Exception('UserDao does not exist.');
    }

    try {
      // 기존 데이터 읽기
      final Map<String, dynamic> existingUserMap = jsonDecode(existingUserJson);

      // 업데이트 적용
      final updatedUserMap = {
        ...existingUserMap,
        ...updates,
      };

      // 수정된 데이터 저장
      final updatedUserJson = jsonEncode(updatedUserMap);
      await _secureStorage.write(key: _userDaoKey, value: updatedUserJson);
    } catch (e) {
      print('Failed to update UserDao: $e');
    }
  }

  /// UserDao 삭제
  Future<void> deleteUserDao() async {
    await _secureStorage.delete(key: _userDaoKey);
  }

}

final class UserDao {
  String uuid;
  String nickName;
  List<String> friendUuids;
  int dailyTargetSteps;
  String socialId;
  String? fcmToken;

  UserDao({
    required this.uuid,
    required this.nickName,
    required this.friendUuids,
    required this.dailyTargetSteps,
    required this.socialId,
    this.fcmToken,
  });

  // JSON 직렬화/역직렬화 지원
  factory UserDao.fromJson(Map<String, dynamic> json) {
    return UserDao(
      uuid: json['uuid'] as String,
      nickName: json['nickName'] as String,
      friendUuids: List<String>.from(json['friendUuids']),
      dailyTargetSteps: json['dailyTargetSteps'] as int,
      socialId: json['socialId'] as String,
      fcmToken: json['fcmToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nickName': nickName,
      'friendUuids': friendUuids,
      'dailyTargetSteps': dailyTargetSteps,
      'socialId': socialId,
      'fcmToken': fcmToken,
    };
  }

  UserDao copyWith({
    String? uuid,
    String? nickName,
    List<String>? friendUuids,
    int? dailyTargetSteps,
    String? socialId,
    String? fcmToken,
  }) {
    return UserDao(
      uuid: uuid ?? this.uuid,
      nickName: nickName ?? this.nickName,
      friendUuids: friendUuids ?? this.friendUuids,
      dailyTargetSteps: dailyTargetSteps ?? this.dailyTargetSteps,
      socialId: socialId ?? this.socialId,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}

class Chat {
  final String userId;
  final String profileImage;
  final String userName;
  final String message;
  final DateTime timeSent;
  final bool hasNewStatus;

  Chat({
    required this.userId,
    required this.profileImage,
    required this.userName,
    required this.message,
    required this.timeSent,
    required this.hasNewStatus,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      userId: json['userId'],
      profileImage: json['profileImage'],
      userName: json['userName'],
      message: json['message'],
      timeSent: DateTime.parse(json['timeSent']),
      hasNewStatus: json['hasNewStatus'],
    );
  }
}
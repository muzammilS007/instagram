class Messages{
  String? senderId;
  String? receiverId;
  int? userType;
  String? fcmId;
  String? filePath;
  String? chatSessionId;
  String? message;
  String? dateTime;

  Messages({this.message,this.senderId,this.receiverId,this.userType,this.fcmId,this.filePath,this.chatSessionId,this.dateTime});

  Messages.fromJson(Map<String, Object?> json)
      : this(
    senderId: json['senderId']! as String,
    receiverId: json['receiverId']! as String,
    userType: json['userType']! as int,
    fcmId: json['fcmId']! as String,
    filePath: json['filePath']! as String,
    chatSessionId: json['chatSessionId']! as String,
    message: json['message']! as String,
    dateTime: json['dateTime']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'userType': userType,
      'fcmId': fcmId,
      'filePath': filePath,
      'chatSessionId': chatSessionId,
      'message': message,
      'dateTime': dateTime,
    };
  }

}
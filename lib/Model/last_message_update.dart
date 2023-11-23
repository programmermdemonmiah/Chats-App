class LastMessageUpdate {
  String lastMessage;
  String time;
  String chatRoomId;

  LastMessageUpdate(
      {required this.lastMessage,
      required this.time,
      required this.chatRoomId});

  Map<String, dynamic> toMap() {
    return {
      "lastMessage": lastMessage,
      "time": time,
      "chatRoomId": chatRoomId,
    };
  }
}

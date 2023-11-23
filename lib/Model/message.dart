
class Message {
  bool isSeen;
  String message;
  String receiverId;
  String senderId;
  DateTime timeStamp;
  String type;

  Message({
    required this.isSeen,
    required this.message,
    required this.receiverId,
    required this.senderId,
    required this.timeStamp,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      "isSeen": isSeen,
      "message": message,
      "receiver": receiverId,
      "sender": senderId,
      "timeStamp": timeStamp,
      "type": type,
    };
  }
}

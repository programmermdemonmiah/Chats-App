// To parse this JSON data, do
//
//     final chatsdata = chatsdataFromJson(jsonString);

import 'dart:convert';

Chatsdata chatsdataFromJson(String str) => Chatsdata.fromJson(json.decode(str));

String chatsdataToJson(Chatsdata data) => json.encode(data.toJson());

class Chatsdata {
  Map<String, Chat>? chats;

  Chatsdata({
    this.chats,
  });

  factory Chatsdata.fromJson(Map<String, dynamic> json) => Chatsdata(
    chats: Map.from(json["chats"]!).map((k, v) => MapEntry<String, Chat>(k, Chat.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "chats": Map.from(chats!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Chat {
  bool? isSeen;
  String? message;
  String? receiver;
  String? sender;
  String? time;
  String? type;

  Chat({
    this.isSeen,
    this.message,
    this.receiver,
    this.sender,
    this.time,
    this.type,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    isSeen: json["isSeen"],
    message: json["message"],
    receiver: json["receiver"],
    sender: json["sender"],
    time: json["time"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "isSeen": isSeen,
    "message": message,
    "receiver": receiver,
    "sender": sender,
    "time": time,
    "type": type,
  };
}

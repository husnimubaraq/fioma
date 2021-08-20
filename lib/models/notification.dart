import 'dart:convert';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    this.totalData,
    this.currentPage,
    this.maxPage,
    this.list,
  });

  int totalData;
  int currentPage;
  int maxPage;
  List<ListElement> list;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        totalData: json["total_data"],
        currentPage: json["current_page"],
        maxPage: json["max_page"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "current_page": currentPage,
        "max_page": maxPage,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.createdDate,
    this.category,
    this.topic,
    this.title,
    this.content,
    this.status,
    this.data,
  });

  int id;
  DateTime createdDate;
  String category;
  String topic;
  String title;
  String content;
  dynamic status;
  dynamic data;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        createdDate: DateTime.parse(json["created_date"]),
        category: json["category"],
        topic: json["topic"],
        title: json["title"],
        content: json["content"] == null ? null : json["content"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_date": createdDate.toIso8601String(),
        "category": category,
        "topic": topic,
        "title": title,
        "content": content == null ? null : content,
        "status": status,
        "data": data,
      };
}

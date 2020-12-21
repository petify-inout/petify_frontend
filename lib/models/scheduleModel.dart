import 'package:flutter/material.dart';

class Schedule {
  String category;
  String description;
  DateTime datetime;
  TimeOfDay time;

  Schedule({this.category, this.datetime, this.description, this.time});

  Schedule.fromJson(Map<String, dynamic> json) {
    category = json["category"];
    description = json["description"];
    datetime = DateTime.parse(json["datetime"]);
    String e = json["time"];
    print(json["time"]);
    String s = e.substring(10, 15);
    print(s);
    time = TimeOfDay(
        hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));
  }

  Map<String, dynamic> toJson(Schedule data) {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["category"] = data.category;
    json["description"] = data.description;
    json["datetime"] = data.datetime.toString();
    json["time"] = data.time.toString();
    return json;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tgc_app/models/position.dart';

class Invoice {
  List<Position> list;
  String name;
  DateTime dateTime;
  int id;

  Invoice({
    required this.list,
    required this.name,
    required this.dateTime,
    this.id = 0,
  });

  int getPositionsCount() => list.length;

  double getTotalPrice() {
    double res = 0;
    for (var element in list) {
      res += element.calculateTotalPrice();
    }
    return res;
  }

  double getTotalSquare() {
    double res = 0;
    for (var element in list) {
      res += element.calculateTotalSquare();
    }
    return res;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
      'name': name,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      list: List<Position>.from(
        (map['list'] as List<int>).map<Position>(
          (x) => Position.fromMap(x as Map<String, dynamic>),
        ),
      ),
      name: map['name'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source) as Map<String, dynamic>);
}

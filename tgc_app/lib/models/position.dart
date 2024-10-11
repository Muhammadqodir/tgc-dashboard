// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tgc_app/models/product.dart';
import 'package:tgc_app/models/size.dart';

class Position {
  Product product;
  int count;
  ProductSize size;
  Position({
    required this.product,
    required this.count,
    required this.size,
  });

  double calculateTotalPrice() => product.price * size.square() * count;

  double calculateTotalSquare() => size.square() * count;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'count': count,
      'size': size.toMap(),
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
      count: map['count'] as int,
      size: ProductSize.fromMap(map['size'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) => Position.fromMap(json.decode(source) as Map<String, dynamic>);
}

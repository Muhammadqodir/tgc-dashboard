// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductSize {
  double height;
  double width;
  ProductSize({
    required this.height,
    required this.width,
  });

  double square() => height * width;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'width': width,
    };
  }

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      height: map['height'] as double,
      width: map['width'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSize.fromJson(String source) => ProductSize.fromMap(json.decode(source) as Map<String, dynamic>);
}

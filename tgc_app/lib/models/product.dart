// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String name;
  String image;
  String type;
  String category;
  double price;
  Product({
    required this.name,
    this.image = "undefined",
    this.type = "undefined",
    this.category = "undefined",
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'type': type,
      'category': category,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      image: map['image'] as String,
      type: map['type'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

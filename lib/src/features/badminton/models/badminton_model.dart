import 'dart:convert';

import 'package:batminton_shop/src/features/badminton/models/product_specifications.dart';

class Badminton {
  String id;
  String name;
  String color;
  double price;
  double priceAfterDiscount;
  int discountPercent;
  String linkImage;
  ProductSpecification specification;

  Badminton({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.priceAfterDiscount,
    required this.discountPercent,
    required this.linkImage,
    required this.specification,
  });

  // Convert Badminton object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'discountPercent': discountPercent,
      'linkImage': linkImage,
      'specification': specification.toMap(),
    };
  }

  // Create Badminton object from Map
  factory Badminton.fromMap(Map<dynamic, dynamic> map) {
    return Badminton(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      price: map['price'].toDouble(),
      priceAfterDiscount: map['priceAfterDiscount'].toDouble(),
      discountPercent: map['discountPercent'],
      linkImage: map['linkImage'],
      specification: ProductSpecification.fromMap(map['specification']),
    );
  }

  // Convert Badminton object to JSON
  String toJson() {
    return toMap().toString();
  }

  // Create Badminton object from JSON
  factory Badminton.fromJson(String json) {
    return Badminton.fromMap(jsonDecode(json));
  }
}
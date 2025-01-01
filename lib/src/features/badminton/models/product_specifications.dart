import 'dart:convert';

class ProductSpecification {
  String description;
  String hardness;
  String balance;
  String frameStructure;
  String joint;
  String weight;
  String handle;

  ProductSpecification({
    required this.description,
    required this.hardness,
    required this.balance,
    required this.frameStructure,
    required this.joint,
    required this.weight,
    required this.handle,
  });

  // Convert ProductSpecification to Map
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'hardness': hardness,
      'balance': balance,
      'frameStructure': frameStructure,
      'joint': joint,
      'weight': weight,
      'handle': handle,
    };
  }

  // Create ProductSpecification from Map
  factory ProductSpecification.fromMap(Map<dynamic, dynamic> map) {
    return ProductSpecification(
      description: map['description'],
      hardness: map['hardness'],
      balance: map['balance'],
      frameStructure: map['frameStructure'],
      joint: map['joint'],
      weight: map['weight'],
      handle: map['handle'],
    );
  }

  // Convert ProductSpecification to JSON
  String toJson() {
    return toMap().toString();
  }

  // Create ProductSpecification from JSON
  factory ProductSpecification.fromJson(String json) {
    return ProductSpecification.fromMap(jsonDecode(json));
  }
}
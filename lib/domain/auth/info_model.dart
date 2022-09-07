import 'dart:convert';

class InfoModel {
  InfoModel({
    required this.name,
    required this.age,
    required this.city,
  });

  String name;
  String age;
  String city;

  InfoModel copyWith({
    String? name,
    String? age,
    String? city,
  }) =>
      InfoModel(
        name: name ?? this.name,
        age: age ?? this.age,
        city: city ?? this.city,
      );

  factory InfoModel.fromJson(String str) =>
      InfoModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        name: json["name"] as String,
        age: json["age"] as String,
        city: json["city"] as String,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "age": age,
        "city": city,
      };
}

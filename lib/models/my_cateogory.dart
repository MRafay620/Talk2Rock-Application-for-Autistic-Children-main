// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyCategory {
  final String name;
  final String imageUrl;
  final Color? color;
  final List<String> points;
  MyCategory({
    required this.name,
    required this.imageUrl,
    this.color,
    required this.points,
  });

  MyCategory copyWith({
    String? name,
    String? imageUrl,
    Color? color,
    List<String>? points,
  }) {
    return MyCategory(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'points': points,
    };
  }

  factory MyCategory.fromMap(Map<String, dynamic> map) {
    final color = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

    return MyCategory(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      color: color,
      points: List<String>.from(map['points'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCategory.fromJson(String source) =>
      MyCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyCategory(name: $name, imageUrl: $imageUrl, color: $color, points: $points)';
  }

  @override
  bool operator ==(covariant MyCategory other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageUrl == imageUrl &&
        other.color == color &&
        listEquals(other.points, points);
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ color.hashCode ^ points.hashCode;
  }
}

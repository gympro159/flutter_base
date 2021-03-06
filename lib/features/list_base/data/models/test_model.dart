import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'test_model.g.dart';

@JsonSerializable()
class Test {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'body')
  final String? body;

  Test({required this.id, required this.title, this.body});

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}

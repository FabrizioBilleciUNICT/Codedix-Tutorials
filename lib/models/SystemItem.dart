
import 'package:json_annotation/json_annotation.dart';
part 'SystemItem.g.dart';

@JsonSerializable()
class SystemItem {

  String id;
  String image;
  String name;
  String details;

  SystemItem({required this.id, required this.image, required this.name, required this.details});

  /// Connect the generated [_$SystemItemFromJson] function to the `fromJson`
  /// factory.
  factory SystemItem.fromJson(Map<String, dynamic> json) =>
      _$SystemItemFromJson(json);

  /// Connect the generated [_$SystemItemToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SystemItemToJson(this);
}
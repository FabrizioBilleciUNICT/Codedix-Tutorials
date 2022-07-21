// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SystemItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemItem _$SystemItemFromJson(Map<String, dynamic> json) => SystemItem(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
    );

Map<String, dynamic> _$SystemItemToJson(SystemItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'details': instance.details,
    };

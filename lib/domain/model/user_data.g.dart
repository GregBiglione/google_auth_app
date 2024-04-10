// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      age: json['age'] as String? ?? "23",
      city: json['city'] as String? ?? "Los Angeles",
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'age': instance.age,
      'city': instance.city,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
  name: Name.fromJson(json['name'] as Map<String, dynamic>),
  region: json['region'] as String,
  flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'flags': instance.flags,
    };

Name _$NameFromJson(Map<String, dynamic> json) =>
    Name(common: json['common'] as String);

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
  'common': instance.common,
};

Flags _$FlagsFromJson(Map<String, dynamic> json) =>
    Flags(png: json['png'] as String);

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
  'png': instance.png,
};

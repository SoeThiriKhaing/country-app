import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/country_entity.dart';


part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: 'name')
  final Name name;

  final String region;

  @JsonKey(name: 'flags')
  final Flags flags;

  CountryModel({
    required this.name,
    required this.region,
    required this.flags,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Country toEntity() => Country(
    name: name.common,
    region: region,
    flagUrl: flags.png,
  );
}

@JsonSerializable()
class Name {
  final String common;

  Name({required this.common});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@JsonSerializable()
class Flags {
  final String png;

  Flags({required this.png});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}

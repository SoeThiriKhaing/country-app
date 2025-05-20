import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_entity.freezed.dart';

@freezed
sealed class Country with _$Country {
  const factory Country({
    required String name,
    required String region,
    required String flagUrl,
  }) = _Country;

}

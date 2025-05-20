import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_event.freezed.dart';

@freezed
sealed class CountryEvent with _$CountryEvent {
  const factory CountryEvent.search(String query) = Search;
  const factory CountryEvent.loadAllCountries ()= LoadAllCountries;
}

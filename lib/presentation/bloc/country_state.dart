import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/domain/entities/country_entity.dart';

part 'country_state.freezed.dart';
@freezed
sealed class CountryState with _$CountryState {
  const factory CountryState.initial() = Initial;
  const factory CountryState.loading() = Loading;
  const factory CountryState.loaded(List<Country> countries) = Loaded;
  const factory CountryState.error(String message) = Error;
}

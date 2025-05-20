import 'package:country/features/domain/usecases/load_alll_countries_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import '../.../features/domain/usecases/load_alll_countries_usecase.dart';
import '../../features/domain/usecases/country_usecase.dart';
import 'country_event.dart';
import 'country_state.dart';


class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final SearchCountry searchCountry;
  final LoadAlllCountriesUsecase loadAllCountries;

  CountryBloc({
    required this.searchCountry,
    required this.loadAllCountries,
  }) : super(const CountryState.initial()) {

    // 🔍 Search Event Handler
    on<Search>((event, emit) async {
      emit(const CountryState.loading());
      final result = await searchCountry(event.query);
      result.fold(
            (failure) => emit(CountryState.error(failure.message)),
            (countries) => emit(CountryState.loaded(countries)),
      );
    });

    // 🌍 Load All Countries Event Handler
    on<LoadAllCountries>((event, emit) async {
      emit(const CountryState.loading());
      final result = await loadAllCountries();
      result.fold(
            (failure) => emit(CountryState.error(failure.message)),
            (countries) => emit(CountryState.loaded(countries)),
      );
    });
  }
}


import '../models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> searchCountry(String name);
  Future<List<CountryModel>> loadAllCountries();
}




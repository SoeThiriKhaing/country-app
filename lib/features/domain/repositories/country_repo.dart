import 'package:dartz/dartz.dart';

import '../../../core/error/error_handling.dart';
import '../entities/country_entity.dart';


abstract class CountryRepository {
  Future<Either<Failure, List<Country>>> searchCountry(String name);
Future<Either<Failure,List<Country>>> loadAllCountries();
}


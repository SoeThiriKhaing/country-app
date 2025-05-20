import 'package:dartz/dartz.dart';

import '../../../core/error/error_handling.dart';
import '../entities/country_entity.dart';
import '../repositories/country_repo.dart';


class SearchCountry {
  final CountryRepository repository;

  SearchCountry(this.repository);

  Future<Either<Failure, List<Country>>> call(String name) {
    return repository.searchCountry(name);
  }
}

import 'package:country/features/domain/repositories/country_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/error_handling.dart';
import '../entities/country_entity.dart';

class LoadAlllCountriesUsecase{
  final CountryRepository repository;
  LoadAlllCountriesUsecase(this.repository);
  Future<Either<Failure, List<Country>>> call() {
    return repository.loadAllCountries();
  }
}



import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/error_handling.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/repositories/country_repo.dart';
import '../data_sources/country_remote_datasource.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;

  CountryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Country>>> searchCountry(String name) async {
    try {
      final models = await remoteDataSource.searchCountry(name);
      debugPrint("Country data in repo impl:$models");
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Country>>> loadAllCountries() async{
    try {
      final models = await remoteDataSource.loadAllCountries();
      debugPrint("Country data in repo impl:$models");
      return Right(models.map((e) => e.toEntity()).toList());
    } catch (_) {
      return Left(ServerFailure());
    }

  }
}

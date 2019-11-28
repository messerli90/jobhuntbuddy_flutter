import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/lead.dart';
import '../../domain/repositories/lead_repository.dart';
import '../datasources/lead_firestore_datasource.dart';

class LeadRepositoryImpl implements LeadRepository {
  final LeadDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LeadRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Lead>> getLeadFromId(String uid) async {
    networkInfo.isConnected;
    try {
      final lead = await remoteDataSource.getLeadFromId(uid);
      return Right(lead);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Lead>>> getLeads() async {
    networkInfo.isConnected;
    try {
      final leads = await remoteDataSource.getLeads();
      return Right(leads);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

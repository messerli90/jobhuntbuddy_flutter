import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/lead.dart';
import '../../domain/repositories/lead_repository.dart';
import '../datasources/lead_remote_datasource.dart';

class LeadRepositoryImpl implements LeadRepository {
  final LeadRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LeadRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Lead>> getLeadFromId(String uid) {
    // TODO: implement getLeadFromId
    return null;
  }

  @override
  Future<Either<Failure, List<Lead>>> getLeads() {
    // TODO: implement getLeads
    return null;
  }
}

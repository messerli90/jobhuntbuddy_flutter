import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/lead.dart';

abstract class LeadRepository {
  Future<Either<Failure, Lead>> getLeadFromId(int id);
  Future<Either<Failure, List<Lead>>> getLeads();
}
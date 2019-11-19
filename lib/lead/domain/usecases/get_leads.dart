import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/lead.dart';
import '../repositories/lead_repository.dart';

class GetLeads implements UseCase<List<Lead>, NoParams> {
  final LeadRepository repository;

  GetLeads(this.repository);

  @override
  Future<Either<Failure, List<Lead>>> call(NoParams params) async {
    return await repository.getLeads();
  }
}

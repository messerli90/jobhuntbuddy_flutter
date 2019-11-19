import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:jobhuntbuddy/core/error/failures.dart';
import 'package:jobhuntbuddy/lead/domain/entities/lead.dart';
import 'package:jobhuntbuddy/lead/domain/repositories/lead_repository.dart';

class GetLeadFromId {
  final LeadRepository repository;

  GetLeadFromId(this.repository);

  Future<Either<Failure, Lead>> execute({@required int id}) async {
    return await repository.getLeadFromId(id);
  }
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jobhuntbuddy/core/usecases/usecase.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/lead.dart';
import '../repositories/lead_repository.dart';

class GetLeadFromId implements UseCase<Lead, Params> {
  final LeadRepository repository;

  GetLeadFromId(this.repository);

  @override
  Future<Either<Failure, Lead>> call(Params params) async {
    return await repository.getLeadFromId(params.id);
  }
}

class Params extends Equatable {
  final int id;

  Params({ @required this.id }) : super([id]);
}
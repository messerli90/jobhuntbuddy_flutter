import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/repositories/lead_repository.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  final LeadRepository _repository;

  LeadBloc({@required LeadRepository repository})
    : assert(repository != null),
    _repository = repository;

  @override
  LeadState get initialState => InitialLeadState();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    if (event is GetLeadFromIdEvent) {
      yield Loading();
      // final failureOrLead = await _repository.getLeadFromId(Params(uid: event.uid));
      // yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      // yield failureOrLead.fold(
      //     (_) => throw UnimplementedError(), (lead) => Loaded(leads: [lead]));
    }
    if (event is GetLeadsEvent) {
      yield Loading();
      final failureOrLeads = await _repository.getLeads();
      yield failureOrLeads.fold(
          (_) => throw UnimplementedError(), (leads) => Loaded(leads: leads));
    }
  }
}

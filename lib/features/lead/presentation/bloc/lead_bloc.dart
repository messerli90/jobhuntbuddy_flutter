import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../data/repositories/lead_repository_impl.dart';
import '../../domain/usecases/get_lead_from_id.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  final LeadRepositoryImpl _leadRepository;

  LeadBloc({@required LeadRepositoryImpl leadRepositoryImpl})
    : assert(leadRepositoryImpl != null),
    _leadRepository = leadRepositoryImpl;

  @override
  LeadState get initialState => InitialLeadState();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    if (event is GetLeadFromIdEvent) {
      yield Loading();
      // final failureOrLead = await _leadRepository.getLeadFromId(Params(uid: event.uid));
      // yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      // yield failureOrLead.fold(
      //     (_) => throw UnimplementedError(), (lead) => Loaded(leads: [lead]));
    }
    if (event is GetLeadsEvent) {
      yield Loading();
      final failureOrLeads = await _leadRepository.getLeads();
      yield failureOrLeads.fold(
          (_) => throw UnimplementedError(), (leads) => Loaded(leads: leads));
    }
  }
}

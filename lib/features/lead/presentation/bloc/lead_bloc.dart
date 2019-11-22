import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/usecases/get_lead_from_id.dart';
import '../../domain/usecases/get_leads.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  final GetLeads getLeads;
  final GetLeadFromId getLeadFromId;

  LeadBloc({@required this.getLeads, @required this.getLeadFromId});

  @override
  LeadState get initialState => InitialLeadState();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    if (event is GetLeadFromIdEvent) {
      yield Loading();
      final failureOrLead = await getLeadFromId(Params(uid: event.uid));
      // yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      yield failureOrLead.fold(
          (_) => throw UnimplementedError(), (lead) => Loaded(leads: [lead]));
    }
  }
}

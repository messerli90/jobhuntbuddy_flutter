import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../domain/repositories/lead_repository.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  final LeadRepository _repository;
  final String _userId;
  StreamSubscription _leadsSubscription;

  LeadBloc({@required LeadRepository repository, @required String userId})
      : assert(repository != null),
        _repository = repository,
        _userId = userId;

  @override
  LeadState get initialState => LeadsLoading();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    if (event is LoadLeads) {
      yield* _mapLoadLeadsToState();
    } else if (event is AddLead) {
      yield* _mapAddLeadToState(event);
    } else if (event is UpdateLead) {
      yield* _mapUpdateLeadToState(event);
    } else if (event is DeleteLead) {
      yield* _mapDeleteLeadToState(event);
    } else if (event is LeadsUpdated) {
      yield* _mapLeadsUpdatedToState(event);
    }
  }

  Stream<LeadState> _mapLoadLeadsToState() async* {
    _leadsSubscription?.cancel();
    _leadsSubscription = _repository.leads(_userId).listen(
          (leads) => add(LeadsUpdated(leads)),
        );
  }

  Stream<LeadState> _mapAddLeadToState(AddLead event) async* {
    _repository.addNewLead(_userId, event.lead);
  }

  Stream<LeadState> _mapUpdateLeadToState(UpdateLead event) async* {
    _repository.updateLead(_userId, event.lead);
  }

  Stream<LeadState> _mapDeleteLeadToState(DeleteLead event) async* {
    _repository.deleteLead(_userId, event.lead);
  }

  Stream<LeadState> _mapLeadsUpdatedToState(LeadsUpdated event) async* {
    yield LeadsLoaded(event.leads);
  }

  @override
  Future<void> close() {
    _leadsSubscription?.cancel();
    return super.close();
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  @override
  LeadState get initialState => InitialLeadState();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    // tod o Add Logic
  }
}

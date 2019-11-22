import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/lead.dart';

abstract class LeadState extends Equatable {
  LeadState([List props = const <dynamic>[]]);
}

class InitialLeadState extends LeadState {
  @override
  List<Object> get props => [];
}

class Loading extends LeadState {
  @override
  List<Object> get props => null;
}

class Loaded extends LeadState {
  final List<Lead> leads;

  Loaded({@required this.leads});

  @override
  List<Object> get props => [leads];
}

class Error extends LeadState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
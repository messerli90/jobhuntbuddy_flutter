import 'package:equatable/equatable.dart';

import '../../data/models/lead_model.dart';

abstract class LeadState extends Equatable {
  const LeadState();

  @override
  List<Object> get props => [];
}

class LeadsLoading extends LeadState {}

class LeadsLoaded extends LeadState {
  final List<LeadModel> leads;

  const LeadsLoaded([this.leads = const []]);

  @override 
  List<Object> get props => [leads];
}

class LeadsNotLoaded extends LeadState {}
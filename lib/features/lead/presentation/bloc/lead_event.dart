import 'package:equatable/equatable.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';

abstract class LeadEvent extends Equatable {
  const LeadEvent();

  @override
  List<Object> get props => [];
}

class LoadLeads extends LeadEvent {}

class AddLead extends LeadEvent {
  final LeadModel lead;

  AddLead(this.lead);

  @override
  List<Object> get props => [lead];
}

class UpdateLead extends LeadEvent {
  final LeadModel lead;

  UpdateLead(this.lead);

  @override
  List<Object> get props => [lead];
}

class DeleteLead extends LeadEvent {
  final LeadModel lead;

  const DeleteLead(this.lead);

  @override
  List<Object> get props => [lead];
}

class LeadsUpdated extends LeadEvent {
  final List<LeadModel> leads;

  LeadsUpdated(this.leads);

  @override
  List<Object> get props => [leads];
}
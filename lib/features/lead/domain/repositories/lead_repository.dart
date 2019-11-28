import '../../data/models/lead_model.dart';

abstract class LeadRepository {
  Future<void> addNewLead(LeadModel lead);

  Future<void> deleteLead(LeadModel lead);

  Stream<List<LeadModel>> leads();

  Future<void> updateLead(LeadModel lead);
}
import '../../data/models/lead_model.dart';

abstract class LeadRepository {
  Future<void> addNewLead(String userId, LeadModel lead);

  Future<void> deleteLead(String userId, LeadModel lead);

  Stream<List<LeadModel>> leads(String userId);

  Future<void> updateLead(String userId, LeadModel lead);
}
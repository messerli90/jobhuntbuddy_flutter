import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/lead_repository.dart';
import '../models/lead_model.dart';

class FirebaseLeadRepository implements LeadRepository {

  @override
  Future<void> addNewLead(String userId, LeadModel lead) {
    final leadCollection = Firestore.instance.collection('users/$userId/leads');
    return leadCollection.add(lead.toJson());
  }

  @override
  Future<void> deleteLead(String userId, LeadModel lead) async {
    final leadCollection = Firestore.instance.collection('users/$userId/leads');
    return leadCollection.document(lead.uid).delete();
  }

  @override
  Stream<List<LeadModel>> leads(String userId) {
    final leadCollection = Firestore.instance.collection('users/$userId/leads');
    return leadCollection.snapshots().map((snap) {
      return snap.documents.map((doc) => LeadModel.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> updateLead(String userId, LeadModel lead) {
    final leadCollection = Firestore.instance.collection('users/$userId/leads');
    return leadCollection.document(lead.uid).updateData(lead.toJson());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/lead_repository.dart';
import '../models/lead_model.dart';

class FirebaseLeadRepository implements LeadRepository {
  final leadCollection = Firestore.instance.collection('test');

  @override
  Future<void> addNewLead(LeadModel lead) {
    return leadCollection.add(lead.toJson());
  }

  @override
  Future<void> deleteLead(LeadModel lead) async {
    return leadCollection.document(lead.uid).delete();
  }

  @override
  Stream<List<LeadModel>> leads() {
    return leadCollection.snapshots().map((snap) {
      return snap.documents.map((doc) => LeadModel.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> updateLead(LeadModel lead) {
    return leadCollection.document(lead.uid).updateData(lead.toJson());
  }
}

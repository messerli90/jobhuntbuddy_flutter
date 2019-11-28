import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lead_model.dart';

abstract class LeadDataSource {
  /// Calls firestore
  /// 
  /// Throws a [ServerException] for all error codes
  Future<LeadModel> getLeadFromId(String uid);

  /// Calls firestore
  /// 
  /// Throws a [ServerException] for all error codes
  Future<List<LeadModel>> getLeads();
}

class LeadFirestoreDatasource implements LeadDataSource {

  @override
  Future<LeadModel> getLeadFromId(String uid) async {
    final DocumentReference ref = Firestore.instance.document('test/$uid');
    final DocumentSnapshot snap = await ref.get();
    return LeadModel.fromJson(snap.data);
  }

  @override
  Future<List<LeadModel>> getLeads() async {
    final CollectionReference ref = Firestore.instance.collection('test');
    final QuerySnapshot snap = await  ref.getDocuments();
    List<LeadModel> leads;
    snap.documents.map((doc) {
      leads.add(LeadModel.fromJson(doc.data));
    });
    return leads;
  }
}
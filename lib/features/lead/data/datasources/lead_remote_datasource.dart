import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';
import 'package:meta/meta.dart';

abstract class LeadRemoteDataSource {
  /// Calls firestore
  /// 
  /// Throws a [ServerException] for all error codes
  Future<LeadModel> getLeadFromId(String uid);

  /// Calls firestore
  /// 
  /// Throws a [ServerException] for all error codes
  Future<List<LeadModel>> getLeads();
}

class LeadRemoteDataSourceImpl implements LeadRemoteDataSource {
  final Firestore firestore;

  LeadRemoteDataSourceImpl({ @required this.firestore });
  
  @override
  Future<LeadModel> getLeadFromId(String uid) async {
    final DocumentReference ref = firestore.document('leads/$uid');
    final DocumentSnapshot snap = await ref.get();
    return LeadModel.fromJson(snap.data);
  }

  @override
  Future<List<LeadModel>> getLeads() async {
    final CollectionReference ref = firestore.collection('leads');
    final QuerySnapshot snap = await  ref.getDocuments();
    List<LeadModel> leads;
    snap.documents.map((doc) {
      leads.add(LeadModel.fromJson(doc.data));
    });
    return leads;
  }
}
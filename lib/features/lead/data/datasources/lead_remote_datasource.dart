import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';

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
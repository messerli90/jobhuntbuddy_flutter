import 'package:flutter_test/flutter_test.dart';
import 'package:jobhuntbuddy/features/lead/data/datasources/lead_remote_datasource.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:mock_cloud_firestore/mock_types.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

void main () {
  // MockFirestoreInstance mockFirestoreInstance;
  // MockCloudFirestore mockCloudFirestore;
  // LeadFirestoreDatasource dataSource;

  // setUp(() {
  //   String source = fixture('firestore.json');
  //   mockCloudFirestore = MockCloudFirestore(source);
  //   dataSource = LeadFirestoreDatasource(firestore: mockFirestoreInstance);
  // });

  // final tLeadModel = LeadModel(uid: 'abc', companyName: 'Hooli');

  // group('getLeads', () {
    // test('should return a list of lead models', () async {
    //   MockCollectionReference col = mockCloudFirestore.collection("leads");
    //   MockQuerySnapshot qSnapshot = await col.getDocuments();
      
    
    //   // final CollectionReference ref = firestore.collection('leads');
    //   when(mockCloudFirestore.collection('leads')).thenAnswer((_) => col);
    //   // final QuerySnapshot snap = await  ref.getDocuments();
    //   when(col.getDocuments()).thenAnswer((_) async => qSnapshot);
      
    //   final result = await dataSource.getLeads();

    //   expect(result.first.companyName, tLeadModel.companyName);
    // });

    // test('should return a single lead model when uid is given', () async {
    //   String tUid = 'abc';
    //   MockCollectionReference col = mockCloudFirestore.collection("leads");
    //   MockDocumentReference docSnapshot = col.document(tUid);
    // });
  // });
}
import 'package:jobhuntbuddy/features/lead/domain/entities/lead.dart';
import 'package:jobhuntbuddy/features/lead/domain/usecases/get_lead_from_id.dart';
import 'package:jobhuntbuddy/features/lead/domain/usecases/get_leads.dart';
import 'package:jobhuntbuddy/features/lead/presentation/bloc/bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetLeads extends Mock implements GetLeads {}

class MockGetLeadFromId extends Mock implements GetLeadFromId {}

void main() {
  LeadBloc bloc;
  MockGetLeads mockGetLeads;
  MockGetLeadFromId mockGetLeadFromId;

  setUp(() {
    mockGetLeads = MockGetLeads();
    mockGetLeadFromId = MockGetLeadFromId();
    bloc = LeadBloc(getLeads: mockGetLeads, getLeadFromId: mockGetLeadFromId);
  });

  test('initialState should be InitialLeadState', () {
    expect(bloc.initialState, equals(InitialLeadState()));
  });
  group('GetLeadFromIdEvent', () {
    final tUid = 'abc';
    final tLead = Lead(uid: 'abc', companyName: 'Hooli');

    test('should return data from get leads from id use case', () async {
      when(mockGetLeadFromId(any)).thenAnswer((_) async => Right(tLead));

      bloc.add(GetLeadFromIdEvent(tUid));
      await untilCalled(mockGetLeadFromId(any));

      verify(mockGetLeadFromId(Params(uid: tUid)));
    });
  });
}

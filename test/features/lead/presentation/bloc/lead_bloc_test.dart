import 'package:jobhuntbuddy/features/lead/data/repositories/lead_repository_impl.dart';

import 'package:jobhuntbuddy/features/lead/presentation/bloc/bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLeadRepository extends Mock implements LeadRepositoryImpl {}

void main() {
  LeadBloc bloc;
  MockLeadRepository mockLeadRepository;
  

  setUp(() {
    mockLeadRepository = MockLeadRepository();
    bloc = LeadBloc(repository: mockLeadRepository);
  });

  tearDown(() {
    bloc.close();
  });

  test('initialState should be InitialLeadState', () {
    expect(bloc.initialState, equals(InitialLeadState()));
  });
  group('GetLeadFromIdEvent', () {
    // final tUid = 'abc';
    // final tLead = Lead(uid: 'abc', companyName: 'Hooli');

    test('should return data from get leads from id use case', () async {
      // when(mockLeadRepository(any)).thenAnswer((_) async => Right(tLead));

      // bloc.add(GetLeadFromIdEvent(tUid));
      // await untilCalled(mockGetLeadFromId(any));

      // verify(mockGetLeadFromId(Params(uid: tUid)));
    });
  });
}

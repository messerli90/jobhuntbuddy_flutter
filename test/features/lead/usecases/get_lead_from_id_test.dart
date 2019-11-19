import 'package:dartz/dartz.dart';
import 'package:jobhuntbuddy/features/lead/domain/entities/lead.dart';
import 'package:jobhuntbuddy/features/lead/domain/repositories/lead_repository.dart';
import 'package:jobhuntbuddy/features/lead/domain/usecases/get_lead_from_id.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLeadRepository extends Mock implements LeadRepository {}

void main() {
  GetLeadFromId usecase;
  MockLeadRepository mockLeadRepository;

  setUp(() {
    mockLeadRepository = MockLeadRepository();
    usecase = GetLeadFromId(mockLeadRepository);
  });

  final tId = 1;
  final tLead = Lead(uid: 'abc', companyName: 'Hooli');

  test('should get leads by ID from the repository', () async {
    when(mockLeadRepository.getLeadFromId(any))
        .thenAnswer((_) async => Right(tLead));
    final result = await usecase(Params(id: tId));

    expect(result, Right(tLead));
    verify(mockLeadRepository.getLeadFromId(tId));
    verifyNoMoreInteractions(mockLeadRepository);
  });
}

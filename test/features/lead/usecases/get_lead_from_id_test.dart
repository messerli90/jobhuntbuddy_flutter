import 'package:dartz/dartz.dart';
import 'package:jobhuntbuddy/lead/domain/entities/lead.dart';
import 'package:jobhuntbuddy/lead/domain/repositories/lead_repository.dart';
import 'package:jobhuntbuddy/lead/domain/usecases/get_lead_from_id.dart';
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
  final tLead = Lead(id: 1, companyName: 'Hooli');

  test('should get leads by ID from the repository', () async {
    when(mockLeadRepository.getLeadFromId(any))
        .thenAnswer((_) async => Right(tLead));
    final result = await usecase.execute(id: tId);

    expect(result, Right(tLead));
    verify(mockLeadRepository.getLeadFromId(tId));
    verifyNoMoreInteractions(mockLeadRepository);
  });
}

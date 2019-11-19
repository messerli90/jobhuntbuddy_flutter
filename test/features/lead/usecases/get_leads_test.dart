import 'package:dartz/dartz.dart';
import 'package:jobhuntbuddy/core/usecases/usecase.dart';
import 'package:jobhuntbuddy/features/lead/domain/entities/lead.dart';
import 'package:jobhuntbuddy/features/lead/domain/repositories/lead_repository.dart';
import 'package:jobhuntbuddy/features/lead/domain/usecases/get_leads.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLeadRepository extends Mock implements LeadRepository {}

void main() {
  GetLeads usecase;
  MockLeadRepository mockLeadRepository;

  setUp(() {
    mockLeadRepository = MockLeadRepository();
    usecase = GetLeads(mockLeadRepository);
  });

  final tLeads = [
    Lead(uid: 'abc', companyName: 'Hooli'),
    Lead(uid: 'def', companyName: 'Pied Piper'),
    Lead(uid: 'ghi', companyName: 'Aviato'),
  ];

  test('should get all leads from the repository', () async {
    when(mockLeadRepository.getLeads())
        .thenAnswer((_) async => Right(tLeads));
    final result = await usecase(NoParams());

    expect(result, Right(tLeads));
    verify(mockLeadRepository.getLeads());
    verifyNoMoreInteractions(mockLeadRepository);
  });
}

import 'package:dartz/dartz.dart';
import 'package:jobhuntbuddy/core/error/exceptions.dart';
import 'package:jobhuntbuddy/core/error/failures.dart';
import 'package:jobhuntbuddy/core/network/network_info.dart';
import 'package:jobhuntbuddy/features/lead/data/datasources/lead_firestore_datasource.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';
import 'package:jobhuntbuddy/features/lead/data/repositories/lead_repository_impl.dart';
import 'package:jobhuntbuddy/features/lead/domain/entities/lead.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements LeadDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  LeadRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = new MockRemoteDataSource();
    mockNetworkInfo = new MockNetworkInfo();
    repository = LeadRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });

  group('getLeadFromId', () {
    final tUid = 'abc';
    final tLeadModel = LeadModel(uid: tUid, companyName: 'Hooli');
    final Lead tLead = tLeadModel;

    test('should check if device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getLeadFromId(tUid);

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource.getLeadFromId(any))
            .thenAnswer((_) async => tLeadModel);

        final result = await repository.getLeadFromId(tUid);
        verify(mockRemoteDataSource.getLeadFromId(tUid));
        expect(result, equals(Right(tLead)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource.getLeadFromId(any))
            .thenThrow(ServerException());

        final result = await repository.getLeadFromId(tUid);
        verify(mockRemoteDataSource.getLeadFromId(tUid));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });

  group('getLeads', () {
    final tLeadModelOne = LeadModel(uid: 'abc', companyName: 'Hooli');
    final tLeadModelTwo = LeadModel(uid: 'def', companyName: 'Pied Piper');
    final tLeadModelThree = LeadModel(uid: 'ghi', companyName: 'Aviato');
    final tLeadList = [
      tLeadModelOne, tLeadModelTwo, tLeadModelThree
    ];

    test('should check if device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getLeads();

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSource.getLeads())
            .thenAnswer((_) async => tLeadList);

        final result = await repository.getLeads();
        verify(mockRemoteDataSource.getLeads());
        expect(result, equals(Right(tLeadList)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        when(mockRemoteDataSource.getLeads())
            .thenThrow(ServerException());

        final result = await repository.getLeads();
        verify(mockRemoteDataSource.getLeads());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}

import 'package:jobhuntbuddy/core/platform/network_info.dart';
import 'package:jobhuntbuddy/features/lead/data/datasources/lead_remote_datasource.dart';
import 'package:jobhuntbuddy/features/lead/data/repositories/lead_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements LeadRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  LeadRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = new MockRemoteDataSource();
    mockNetworkInfo = new MockNetworkInfo();
    repository = LeadRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo
    );
  });
}

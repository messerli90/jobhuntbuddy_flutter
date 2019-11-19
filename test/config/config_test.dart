import 'package:jobhuntbuddy/config/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConfigFile', () {
    test('should return value associated to key from given yaml file', () {
      final Config config = new Config('test/fixtures/config.yaml');

      final result = config.get('first');

      expect(result, 'test123');
    });

    test('should return nested value associated to key from given yaml file',
        () {
      final Config config = new Config('test/fixtures/config.yaml');

      final result = config.get('nested');

      expect(result['nestedkey'], 'foundme123');
    });
  });
}

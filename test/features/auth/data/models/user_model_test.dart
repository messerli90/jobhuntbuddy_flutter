import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jobhuntbuddy/features/auth/data/models/user_model.dart';
import 'package:jobhuntbuddy/features/auth/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(uid: 'abc', email: 'test@gmail.com');

  test('should be a subclass of User entity', () {
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON has one object', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('firebase_user.json'));
      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
    test(
        'should return a valid model when the JSON has one object with incomplete attributes',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('incomplete_firebase_user.json'));
      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test('should return a json map containing the proper data', () async {
      final result = tUserModel.toJson();
      final expectedMap = {"uid": "abc", "email": "test@gmail.com"};

      expect(result, expectedMap);
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jobhuntbuddy/features/lead/data/models/lead_model.dart';
import 'package:jobhuntbuddy/features/lead/domain/entities/lead.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLeadModel = LeadModel(uid: 'abc', companyName: 'Hooli');

  test('should be a subclass of Lead entity', () {
    expect(tLeadModel, isA<Lead>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON has one object', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('lead.json'));
      final result = LeadModel.fromJson(jsonMap);

      expect(result, tLeadModel);
    });
    test(
        'should return a valid model when the JSON has one object with incomplete attributes',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('incomplete_lead.json'));
      final result = LeadModel.fromJson(jsonMap);

      expect(result, tLeadModel);
    });
  });

  group('toJson', () {
    test('should return a json map containing the proper data', () async {
      final result = tLeadModel.toJson();
      final expectedMap = {"uid": "abc", "companyName": "Hooli"};

      expect(result, expectedMap);
    });
  });
}

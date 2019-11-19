import 'dart:io';
import 'package:yaml/yaml.dart';

/// Read supplied YAML file starting from project root
/// 
/// ```dart
/// new Config('config/env.yaml')
/// ```
class Config {
  final String fileName;
  Config(this.fileName);

  /// Returns value at given key
  /// ```dart
  /// Config config.get('db_url')
  /// ```
  get(String key) {
    var yaml = loadYaml(File(this.fileName).readAsStringSync());

    return yaml[key];
  }
}
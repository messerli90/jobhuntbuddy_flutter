import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'app.dart';

void main() async {
  await di.init();
  runApp(App());
}  

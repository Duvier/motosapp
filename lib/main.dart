import 'package:flutter/material.dart';

import './src/injection_container.dart' as di;
import 'src/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
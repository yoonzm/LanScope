import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/login_page.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const QimeiApp());
}

class QimeiApp extends StatelessWidget {
  const QimeiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: '汽美管家',
    debugShowCheckedModeBanner: false,
    theme: buildTheme(),
    home: const LoginPage(),
  );
}

import 'package:flutter/material.dart';

import 'pages/builder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Ejemplo api', debugShowCheckedModeBanner: false, home: BuilderPage());
  }
}

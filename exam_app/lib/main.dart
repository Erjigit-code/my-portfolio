import 'package:exam_app/providers/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/home-page/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TabProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('ru', 'RU'), // Русский язык
        Locale('en', 'US'),
      ],
      locale: Locale('ru', 'RU'),
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

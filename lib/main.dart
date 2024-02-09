import 'package:flutter/material.dart';
import 'package:islamy/widgets/hadeth_details.dart';
import 'package:islamy/widgets/sura_details.dart';
import 'package:islamy/pages/home/home_page.dart';
import 'package:islamy/pages/tabs/hadeth_tab.dart';
import 'package:islamy/pages/tabs/quran_tab.dart';
import 'package:islamy/pages/tabs/radio_tab.dart';
import 'package:islamy/pages/tabs/sebha_tab.dart';
import 'package:islamy/pages/tabs/settings_tab.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        QuranTab.routeName: (context) => const QuranTab(),
        HadethTab.routeName: (context) => const HadethTab(),
        RadioTab.routeName: (context) => const RadioTab(),
        SebhaTab.routeName: (context) => const SebhaTab(),
        SettingsTab.routeName: (context) => const SettingsTab(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
    );
  }
}

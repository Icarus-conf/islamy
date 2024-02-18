import 'package:flutter/material.dart';

import 'package:islamy/components/text_format.dart';
import 'package:islamy/pages/tabs/hadeth_tab.dart';
import 'package:islamy/pages/tabs/quran_tab.dart';
// import 'package:islamy/pages/tabs/radio_tab.dart';
import 'package:islamy/pages/tabs/sebha_tab.dart';
import 'package:islamy/pages/tabs/settings_tab.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'Home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    // const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        themeProvider.themeData == lightMode
            ? Image.asset(
                'assets/images/default_bg.png',
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/dark_bg.png',
                fit: BoxFit.cover,
              ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Amiri(
              text: 'إسلامي',
              fontS: 30,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            iconSize: 35,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.white,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/ic_quran.png',
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/ic_hadeth.png',
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/ic_sebha.png',
                  ),
                ),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: ImageIcon(
              //     AssetImage(
              //       'assets/images/ic_radio.png',
              //     ),
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:islamy/components/text_format.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'Sebha_Tab';
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  List<String> prays = [
    'سبحان الله',
    'الحمدلله',
    'لا إله إلا الله',
    'اللهم صل وسلم على محمد',
  ];

  prayCounter() {
    counter++;
    for (int i = 0; i < prays.length; i++) {
      if (counter == 30) {
        index = (index + 1) % prays.length;
        counter = 0;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          GestureDetector(
            onTap: prayCounter,
            child: themeProvider.themeData == lightMode
                ? Image.asset(
                    'assets/images/sebha.png',
                  )
                : Image.asset(
                    'assets/images/sebha_dark.png',
                  ),
          ),
          const SizedBox(
            height: 25,
          ),
          const elMessiri(
            text: 'عدد التسبيحات',
            fontS: 25,
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.57),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '$counter',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: prayCounter,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                prays[index],
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

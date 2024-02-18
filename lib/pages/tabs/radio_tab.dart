import 'package:flutter/material.dart';
import 'package:islamy/components/text_format.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'Radio_Tab';
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_image.png'),
        const Amiri(text: 'إذاعة القرآن الكريم', fontS: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              themeProvider.themeData == lightMode
                  ? 'assets/images/ic-back.png'
                  : 'assets/images/ic-back-dark.png',
            ),
            Image.asset(
              themeProvider.themeData == lightMode
                  ? 'assets/images/ic_play_radio.png'
                  : 'assets/images/ic-play-radio-dark.png',
            ),
            Image.asset(
              themeProvider.themeData == lightMode
                  ? 'assets/images/ic-next.png'
                  : 'assets/images/ic-next-dark.png',
            ),
          ],
        ),
      ],
    );
  }
}

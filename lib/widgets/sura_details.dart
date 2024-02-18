import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/components/constants/colors.dart';

import 'package:islamy/components/text_format.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'Sura_Details';
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  suraReader(int index) async {
    final sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    final List<String> lines = sura.trim().split('\n');
    verses = lines;
    setState(() {});
    return verses;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      suraReader(suraModel.index);
    }
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
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Amiri(
              text: suraModel.name,
              fontS: 30,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            color: primaryColor,
                          ),
                        );
                      },
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return Amiri(
                          text: '${verses[index].trim()} (${index + 1})',
                          fontS: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          color: Theme.of(context).colorScheme.secondary,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

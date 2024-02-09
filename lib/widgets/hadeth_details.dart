import 'package:flutter/material.dart';
import 'package:islamy/components/text_format.dart';
import 'package:islamy/model/hadeth_model.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'Hadeth_Details';
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDeatailsState();
}

class _HadethDeatailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var ahadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.builder(
                itemCount: ahadeth.content.length,
                itemBuilder: (context, index) {
                  return elMessiri(
                    text: ahadeth.content[index],
                    letterSpacing: 1.2,
                    fontS: 20,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:islamy/components/constants/colors.dart';
import 'package:islamy/widgets/sura_details.dart';
import 'package:islamy/components/sura_names.dart';
import 'package:islamy/components/text_format.dart';
import 'package:islamy/model/sura_model.dart';

class QuranTab extends StatefulWidget {
  static const String routeName = 'Quran_Tab';
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Image.asset(
            'assets/images/qur2an_screen_logo.png',
          ),
          const Divider(
            color: primaryColor,
            thickness: 3,
          ),
          const elMessiri(
            text: 'اسم السورة',
            fontS: 25,
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: primaryColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: suraName.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: primaryColor,
                  endIndent: 50,
                  indent: 50,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SuraDetails.routeName,
                      arguments: SuraModel(name: suraName[index], index: index),
                    );
                  },
                  child: Text(
                    suraName[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

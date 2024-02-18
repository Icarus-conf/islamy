import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/components/constants/colors.dart';
import 'package:islamy/widgets/hadeth_details.dart';
import 'package:islamy/components/text_format.dart';
import 'package:islamy/model/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = 'Hadeth_Tab';
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<int> numbers = List.generate(51, (index) => index);

  List<HadethModel> ahadeth = [];

  readHadeth() async {
    String filePath = 'assets/ahadeth/ahadeth.txt';

    rootBundle.loadString(filePath).then((file) {
      List<String> ahadethL = file.split('#');
      for (int i = 0; i < ahadethL.length; i++) {
        String hadeth = ahadethL[i];
        List<String> hadithLines = hadeth.trim().split('\n');
        String hadethTitle = hadithLines[0];
        hadithLines.removeAt(0);
        List<String> hadithContent = hadithLines;
        HadethModel hadethModel =
            HadethModel(title: hadethTitle, content: hadithContent);
        ahadeth.add(hadethModel);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readHadeth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          const Divider(
            color: primaryColor,
            thickness: 3,
          ),
          const Amiri(
            text: 'الأحاديث',
            fontS: 25,
            textAlign: TextAlign.center,
          ),
          const Divider(
            color: primaryColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: primaryColor,
                  endIndent: 50,
                  indent: 50,
                );
              },
              itemCount: ahadeth.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadethDetails.routeName,
                      arguments: ahadeth[index],
                    );
                  },
                  child: Text(
                    ahadeth[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
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

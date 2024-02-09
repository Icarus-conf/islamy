import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/theme/theme.dart';
import 'package:islamy/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = 'Settings_Tab';
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 25.0,
        ),
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              themeProvider.themeData == lightMode ? 'Dark Mode' : 'Light Mode',
            ),
            CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}

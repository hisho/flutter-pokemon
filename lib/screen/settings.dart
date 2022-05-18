import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [SelectThemeMode()],
    );
  }
}

class SelectThemeMode extends StatefulWidget {
  const SelectThemeMode({Key? key}) : super(key: key);

  @override
  State<SelectThemeMode> createState() => _SelectThemeModeState();
}

class _SelectThemeModeState extends State<SelectThemeMode> {
  ThemeMode _themeMode = ThemeMode.system;

  void onChangeThemeMode(ThemeMode? selectedValue) {
    if (selectedValue is ThemeMode) {
      setState(() {
        _themeMode = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: ListTile(
        leading:
            Icon(_themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.sunny),
        title: const Text('Appearance'),
        subtitle: const Text('Customize how Notion looks on your device.'),
        trailing: SizedBox(
          width: 100.0,
          child: DropdownButton<ThemeMode>(
            items: const [
              DropdownMenuItem(child: Text('system'), value: ThemeMode.system),
              DropdownMenuItem(child: Text('dark'), value: ThemeMode.dark),
              DropdownMenuItem(child: Text('light'), value: ThemeMode.light),
            ],
            underline: Container(
              height: 0,
            ),
            isExpanded: true,
            onChanged: onChangeThemeMode,
            value: _themeMode,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
            ),
          ),
          child: const ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Appearance'),
            subtitle: Text('Customize how Notion looks on your device.'),
            trailing: SelectThemeMode(),
          ),
        ),
      ],
    );
  }
}

class SelectThemeMode extends StatefulWidget {
  const SelectThemeMode({Key? key}) : super(key: key);

  @override
  State<SelectThemeMode> createState() => _SelectThemeModeState();
}

class _SelectThemeModeState extends State<SelectThemeMode> {
  ThemeMode _dropdownValue = ThemeMode.system;

  void dropdownCallback(ThemeMode? selectedValue) {
    if (selectedValue is ThemeMode) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        onChanged: dropdownCallback,
        value: _dropdownValue,
      ),
    );
  }
}

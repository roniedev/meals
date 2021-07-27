import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    this.settings = widget.settings;
  }

  Widget _createSwitch(
      {required String title,
      required String subtitle,
      required bool value,
      required Function(bool) onChanged}) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem glutén',
                  subtitle: 'Só exibe refeições sem glutén',
                  value: settings.isGlutenFree,
                  onChanged: (value) {
                    setState(() {
                      settings.isGlutenFree = !settings.isGlutenFree;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Sem lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: settings.isLactoseFree,
                  onChanged: (value) {
                    setState(() {
                      settings.isLactoseFree = !settings.isLactoseFree;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições Veganas',
                  value: settings.isVegan,
                  onChanged: (value) {
                    setState(() {
                      settings.isVegan = !settings.isVegan;
                    });
                  },
                ),
                _createSwitch(
                  title: 'Vegetariano',
                  subtitle: 'Só exibe refeições vegetarianas',
                  value: settings.isVegetarian,
                  onChanged: (value) {
                    setState(() {
                      settings.isVegetarian = !settings.isVegetarian;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

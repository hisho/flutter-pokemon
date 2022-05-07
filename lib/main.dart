import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey.withOpacity(0.5),
            height: 1,
          ),
          padding: EdgeInsets.zero,
          itemCount: 1000,
          itemBuilder: (context, index) => PokemonListItem(index: index),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (index) => {setState(() => currentIndex = index)},
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'settings')
        ],
      ),
    );
  }
}

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.red,
      contentPadding:
          const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      hoverColor: Colors.black12.withOpacity(0.1),
      focusColor: Colors.black12.withOpacity(0.1),
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.5),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png'),
          ),
        ),
      ),
      title: Text(
        "Pikachu ${index.toString().padLeft(3, '0')}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('⚡ ️electric'),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokemonDetail(),
          ),
        ),
      },
    );
  }
}

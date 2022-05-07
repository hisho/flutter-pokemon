import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey.withOpacity(0.5),
          height: 1,
        ),
        padding: EdgeInsets.zero,
        itemCount: 1000,
        itemBuilder: (context, index) => PokemonListItem(index: index),
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

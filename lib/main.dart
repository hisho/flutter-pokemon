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
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) => Container(
          color: Colors.red.withOpacity(0.5),
          child: ElevatedButton(onPressed: () => {}, child: const Text('test')),
        ),
      ),
    );
  }
}

class PikaButton extends StatelessWidget {
  const PikaButton({Key? key, required int index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('detail'),
      onPressed: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokemonDetail(),
          ),
        ),
      },
    );
  }
}

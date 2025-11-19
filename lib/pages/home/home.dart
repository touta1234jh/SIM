import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/entities/game.dart';

import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Game> _games = [];
  final String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla est nisl, sollicitudin ac sodales eget, lacinia ut libero. Sed libero nisl, sodales et quam ultrices, lacinia laoreet erat. Maecenas iaculis consequat enim id dignissim. Aliquam hendrerit porttitor quam, non accumsan mi varius vel. Aenean fringilla et felis quis sodales. Nam et nisi blandit, accumsan lectus vulputate, tristique neque.";

  @override
  void initState() {
    _games.add(Game("Devil May Cry 5", _description, "assets/images/dmc5.jpg", 200, 2000));
    _games.add(Game("RE VIII", _description, "assets/images/re8.jpg", 200, 4000));
    _games.add(Game("RDR 2", _description, "assets/images/rdr2.jpg", 150, 5000));
    _games.add(Game("NFS Heat", _description, "assets/images/nfs.jpg", 100, 6000));
    _games.add(Game("FIFA 22", _description, "assets/images/fifa.jpg", 100, 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE ESPRIT"),
      ),
      body: ListView.builder(
        itemCount: _games.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductInfo(_games[index]);
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../entities/game.dart';
import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Game> _games = [];
  final String _baseUrl = "10.0.2.2:9090"; // Vérifie le port
  late Future<bool> _fetchedGames;

  Future<bool> _fetchGames() async {
    try {
      final response = await http.get(Uri.http(_baseUrl, "/game")); // endpoint pour tous les jeux
      if (response.statusCode == 200) {
        final List<dynamic> gamesFromServer = json.decode(response.body);
        _games.clear();
        for (var element in gamesFromServer) {
          _games.add(Game(
            id: element['_id'] ?? '',
            title: element['title'] ?? '',
            description: element['description'] ?? '',
            image: element['image'] ?? '',
            price: int.parse(element['price'].toString()),
            quantity: int.parse(element['quantity'].toString()),
          ));
        }
        return true;
      } else {
        print("Erreur backend: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Erreur fetchGames: $e");
      return false;
    }
  }

  @override
  void initState() {
    _fetchedGames = _fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchedGames,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data == true && _games.isNotEmpty) {
          return ListView.builder(
            itemCount: _games.length,
            itemBuilder: (context, index) => ProductInfo(_games[index]),
          );
        } else {
          return const Center(child: Text("Aucun jeu disponible"));
        }
      },
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../entities/game.dart';
import 'my_game_info.dart';

class MyGames extends StatefulWidget {
  const MyGames({super.key});

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final List<Game> _games = [];
  final String _baseUrl = "10.0.2.2:9090";
  late Future<bool> _fetchedGames;

  @override
  void initState() {
    super.initState();
    _fetchedGames = _fetchGames();
  }

  Future<bool> _fetchGames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");

    if (userId == null) return false;

    final response = await http.get(Uri.http(_baseUrl, "/library/$userId"));

    if (response.statusCode == 200) {
      List<dynamic> gamesFromServer = json.decode(response.body);

      setState(() {
        _games.clear();
        for (var g in gamesFromServer) {
          _games.add(Game(
            id: g['_id'], // si tu utilises id dans ton Game
            title: g['title'],
            description: g['description'] ?? "",
            image: g['image'] ?? "assets/images/default.jpg", // fallback si image manquante
            price: int.parse(g['price'].toString()),
            quantity: int.parse(g['quantity'].toString()),
          ));
        }
      });

      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _fetchedGames,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || _games.isEmpty) {
          return const Center(child: Text("Aucun jeu acheté."));
        }

        return GridView.builder(
          itemCount: _games.length,
          itemBuilder: (BuildContext context, int index) {
            return MyGameInfo(_games[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 120,
          ),
        );
      },
    );
  }
}
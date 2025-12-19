import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../entities/game.dart';
import 'element_info.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  final List<Game> _games = [];
  final String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut "
      "labore et dolore magna aliqua. Ut enim ad minim veniam, "
      "quis nostrud exercitation ullamco laboris nisi ut "
      "aliquip ex ea commodo consequat. Duis aute irure dolor "
      "in reprehenderit in voluptate velit esse cillum dolore "
      "eu fugiat nulla pariatur. Excepteur sint occaecat "
      "cupidatat non proident, sunt in culpa qui officia "
      "deserunt mollit anim id est laborum.";

  int get total {
    return _games.fold(0, (sum, g) => sum + g.price);
  }

  final String _baseUrl = "10.0.2.2:9090";

  @override
  void initState() {
    super.initState();

    _games.addAll([
      Game(
        title: "Devil May Cry",
        description: _description,
        image: "dmc5.jpg",
        price: 200,
        quantity: 3000,
      ),
      Game(
        title: "Resident Evil VIII",
        description: _description,
        image: "re8.jpg",
        price: 200,
        quantity: 3000,
      ),
      Game(
        title: "Need For Speed Heat",
        description: _description,
        image: "nfs.jpg",
        price: 100,
        quantity: 3000,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total : $total TND",
              textScaleFactor: 1.5,
            ),
            const SizedBox(width: 10),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const Divider(color: Colors.red),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _games.length,
            itemBuilder: (BuildContext context, int index) {
              Game game = _games[index];
              return ElementInfo(
                game,
                onDelete: () async {
                  // 🔹 Supprimer le jeu de la liste locale
                  setState(() {
                    _games.removeAt(index);
                  });

                  // 🔹 Si tu veux appeler le backend pour supprimer, tu peux garder ce code :
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? userId = prefs.getString("userId");
                  if (userId != null && game.id != null) {
                    final response = await http.post(
                      Uri.http(_baseUrl, "/basket/remove"),
                      headers: {"Content-Type": "application/json"},
                      body: json.encode({"userId": userId, "gameId": game.id}),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.statusCode == 200
                            ? "Jeu supprimé du panier"
                            : "Erreur lors de la suppression"),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/game.dart';

class ProductDetails extends StatefulWidget {
  final Game _game;

  const ProductDetails(this._game, {super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final String _baseUrl = "10.0.2.2:9090";

  late int _currentQuantity;

  @override
  void initState() {
    _currentQuantity = widget._game.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._game.title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.network("http://10.0.2.2:9090/img/${widget._game.image}", width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._game.description),
          ),
          Text("${widget._game.price} TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : $_currentQuantity"),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Acheter", textScaleFactor: 2)
                ],
              ),
              onPressed: () async {
                // 1️⃣ Récupérer userId
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? userId = prefs.getString("userId");

                // 2️⃣ Vérifications
                if (userId == null) {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Erreur"),
                      content: Text("Utilisateur non connecté"),
                    ),
                  );
                  return;
                }

                if (widget._game.id == null) {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text("Erreur"),
                      content: Text("Jeu invalide"),
                    ),
                  );
                  return;
                }
                print("USER ID = $userId");
                print("GAME ID = ${widget._game.id}");
                // 3️⃣ Appel backend
                final response = await http.post(
                  Uri.http(_baseUrl, "/library"),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode({
                    "user": userId,
                    "game": widget._game.id,
                  }),
                );

                print("STATUS = ${response.statusCode}");
                print("BODY = ${response.body}");

                // 4️⃣ Résultat
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Information"),
                    content: Text(
                      response.statusCode == 200
                          ? "Jeu ajouté au panier"
                          : "Erreur lors de l’ajout au panier",
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../entities/game.dart';
import '../product_details.dart';

class ProductInfo extends StatelessWidget {
  final Game _game;
  final VoidCallback? onDelete; // callback optionnelle

  const ProductInfo(this._game, {this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetails(_game)),
          );
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.network(
                "http://10.0.2.2:9090/img/${_game.image}",
                width: 170,
                height: 90,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_game.title),
                  Text("${_game.price} TND", textScaleFactor: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
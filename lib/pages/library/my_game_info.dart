import 'package:flutter/material.dart';
import '../../entities/game.dart';

class MyGameInfo extends StatelessWidget {
  final Game _game;

  const MyGameInfo(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Image.network(
                "http://10.0.2.2:9090/img/${_game.image}",
                width: 155,
                height: 58,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    "assets/images/default.jpg",
                    width: 155,
                    height: 58,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Text(_game.title)
          ],
        ),
      ),
    );
  }
}
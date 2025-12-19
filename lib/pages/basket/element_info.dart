import 'package:flutter/material.dart';
import '../../entities/game.dart';

class ElementInfo extends StatelessWidget {
  final Game _game;
  final VoidCallback? onDelete; // callback pour suppression

  const ElementInfo(this._game, {this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.restore_from_trash_rounded,
                size: 40,
                color: Colors.red,
              ),
              onPressed: onDelete,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Image.network(
                  "http://10.0.2.2:9090/img/${_game.image}", // juste le nom du fichier
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Image.asset(
                    "assets/images/default.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "${_game.price} TND",
                textScaleFactor: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
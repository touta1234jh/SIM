import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/entities/game.dart';

class ProductInfo extends StatelessWidget {
  final Game _game;

  const ProductInfo(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(_game.image, width: 170, height: 90,),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_game.title),
              Text("${_game.price} TND", textScaleFactor: 2,)
            ],
          )
        ],
      ),
    );
  }
}

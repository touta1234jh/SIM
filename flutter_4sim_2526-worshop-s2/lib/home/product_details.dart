import 'package:flutter/material.dart';
import '../screens/details_page.dart';

class ProductDetails extends StatelessWidget {
  final String _image;
  final String _title;
  final int _price;

  const ProductDetails(this._image, this._title, this._price, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              image: _image,
              title: _title,
              price: _price,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(_image, width: 170, height: 90),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("$_price TND", textScaleFactor: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

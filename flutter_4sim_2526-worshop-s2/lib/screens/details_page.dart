import 'package:flutter/material.dart';
import 'inscription.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  final int price;

  const DetailsPage({super.key, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(image, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "$price TND",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Acheter"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inscription()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

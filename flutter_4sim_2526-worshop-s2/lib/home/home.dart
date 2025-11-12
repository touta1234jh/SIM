import 'package:flutter/material.dart';

import 'product_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE ESPRIT"),
      ),
      body: Column(
        children: [
          ProductDetails("assets/images/dmc5.jpg", "Devil May Cry 5", 200),
          ProductDetails("assets/images/fifa.jpg", "FIFA 22", 100),
          ProductDetails("assets/images/re8.jpg", "Resident Evil VIII", 200),
          ProductDetails("assets/images/rdr2.jpg", "RDR 2", 150),
          ProductDetails("assets/images/nfs.jpg", "Need For Speed Heat", 100),
        ],
      ),
    );
  }
}

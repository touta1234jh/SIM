import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/entities/game.dart';
import 'package:workshop_4sim2_2526/pages/product_details.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final List<Game> _ownedGames = [];
  final String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla est nisl, sollicitudin ac sodales eget, lacinia ut libero. Sed libero nisl, sodales et quam ultrices, lacinia laoreet erat. Maecenas iaculis consequat enim id dignissim. Aliquam hendrerit porttitor quam, non accumsan mi varius vel. Aenean fringilla et felis quis sodales. Nam et nisi blandit, accumsan lectus vulputate, tristique neque.";

  @override
  void initState() {
    // Jeux possédés par l'utilisateur
    _ownedGames.add(Game("Devil May Cry 5", _description, "assets/images/dmc5.jpg", 200, 2000));
    _ownedGames.add(Game("RE VIII", _description, "assets/images/re8.jpg", 200, 4000));
    _ownedGames.add(Game("NFS Heat", _description, "assets/images/nfs.jpg", 100, 6000));
    super.initState();
  }

  void _navigateToDetails(Game game) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(
          game.image,
          game.title,
          game.description,
          game.price,
          game.quantity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma bibliothèque"),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            tooltip: "Se déconnecter",
          ),
        ],
      ),
      body: _ownedGames.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videogame_asset_off,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            Text(
              "Votre bibliothèque est vide",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: _ownedGames.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildGameCard(_ownedGames[index]);
        },
      ),
    );
  }

  Widget _buildGameCard(Game game) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _navigateToDetails(game),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                game.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
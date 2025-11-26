import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/entities/game.dart';

class Panier extends StatefulWidget {
  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  final List<Game> _games = [];
  final String _description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla est nisl, sollicitudin ac sodales eget, lacinia ut libero.";

  @override
  void initState() {
    super.initState();
    _games.add(Game("Devil May Cry 5", _description, "assets/images/dmc5.jpg", 200, 2000));
    _games.add(Game("RE VIII", _description, "assets/images/re8.jpg", 200, 4000));
    _games.add(Game("NFS Heat", _description, "assets/images/nfs.jpg", 300, 6000));
    // garde statique comme demandé
  }

  // calcule le total (quantité = 1 pour chaque jeu)
  int _calculateTotal() {
    return _games.fold(0, (sum, g) {
      // Si votre Game a un autre nom de champ que `price`, changez `g.price` par le nom correct (ex: g.prix).
      final dynamic p = g.price;
      if (p is int) return sum + p;
      if (p is double) return sum + p.toInt();
      // fallback: si p est String convertible
      if (p is String) {
        final parsed = int.tryParse(p) ?? 0;
        return sum + parsed;
      }
      return sum;
    });
  }

  void _removeAt(int index) {
    setState(() {
      _games.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          // ligne du total (alignée à droite sous l'appbar)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "Total : $total TND",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Colors.redAccent),
          // liste des items
          Expanded(
            child: _games.isEmpty
                ? const Center(child: Text("Votre panier est vide."))
                : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              itemCount: _games.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final game = _games[index];
                // Assure que l'image existe ; sinon affiche placeholder
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    child: Row(
                      children: [
                        // icône corbeille
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => _removeAt(index),
                          tooltip: "Supprimer",
                        ),

                        // image du jeu
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            game.image,
                            width: 120,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, o, s) => Container(
                              width: 120,
                              height: 60,
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.videogame_asset_outlined),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // laisser l'espace pour le price à droite
                        Expanded(
                          child: Text(
                            game.title,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),

                        // prix aligné à droite
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "${game.price} TND",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
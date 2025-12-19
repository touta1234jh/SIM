import 'package:flutter/material.dart';

import '../basket/basket.dart';
import '../home/home.dart';

import '../home/home.dart';
import '../library/my_games.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int _selectedIndex = 0;
  final List<Widget> _page = [ Home(), MyGames(), Basket() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G-STORE ESPRIT"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text("G-Store ESPRIT"),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text("Modifier profil"),
              leading: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, "/home/updateUser");
              },
            ),
            ListTile(
                title: Text("Navigation par onglets"),
                leading: Icon(Icons.tab_outlined),
                onTap: () {
                  Navigator.pushNamed(context, "/navTab");
                }
            )
          ],
        ),
      ),
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Bibliothèque",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Panier",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

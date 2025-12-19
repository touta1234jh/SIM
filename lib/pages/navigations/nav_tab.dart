import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:workshop_4sim2_2526/pages/basket/basket.dart';
import 'package:workshop_4sim2_2526/pages/library/my_games.dart';

import '../home/home.dart';

class NavTab extends StatefulWidget {
  const NavTab({super.key});

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  final List<Widget> _page = [ Home(), MyGames(), Basket() ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("G-STORE ESPRIT"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Store",
                icon: Icon(Icons.store),
              ),
              Tab(
                text: "Bibliothèque",
                icon: Icon(Icons.list_alt),
              ),
              Tab(
                text: "Panier",
                icon: Icon(Icons.shopping_basket),
              ),
            ],
          ),
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
                title: Text("Navigation du bas"),
                leading: Icon(Icons.file_download_done_outlined),
                onTap: () {
                  Navigator.pushNamed(context, "/navBottom");
                }
              ),
              ListTile(
                  title: Text("Se déconnecter"),
                  leading: Icon(Icons.logout),
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove("userId");
                    print(prefs.containsKey("userId"));
                    Navigator.pushReplacementNamed(context, "/signin");
                  }
              )
            ],
          ),
        ),
        body: TabBarView(children: _page),
      ),
    );
  }
}

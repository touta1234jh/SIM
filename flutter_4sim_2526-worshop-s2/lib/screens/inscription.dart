import 'package:flutter/material.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/minecraft.jpg"),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: "Username")),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: "Email")),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Mot de passe"),
              ),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: "Année de naissance")),
              const SizedBox(height: 10),
              const TextField(decoration: InputDecoration(labelText: "Adresse de facturation")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("S'inscrire"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Annuler"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

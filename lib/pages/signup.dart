import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String _username;
  late String _email;
  late String _password;
  late int _birthYear;
  late String _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
                validator: (String? value) {
                  if(value!.length < 5 || value.isEmpty)
                    return "Le nom d'utilisateur doit contenir au moins 5 caractères.";
                  return null;
                },
                onSaved: (String? value) {
                  _username = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
                validator: (value) {
                  RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if(!regex.hasMatch(value!))
                    return "Veuillez entrer une adresse email valide.";
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Mot de passe"),
                validator: (value) {
                  if(value!.length < 5 || value.isEmpty)
                    return "Le mot de passe doit contenir au moins 5 caractères.";
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Année de naissance"),
                validator: (value) {
                  if(value!.isEmpty || value.length < 4)
                    return "Veuillez entrer une année de naissance valide.";
                  int year = int.parse(value);
                  if(year > 2025)
                    return "Veuillez entrer une année de naissance valide.";
                  return null;
                },
                onSaved: (value) {
                  _birthYear = int.parse(value!);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Adresse de facturation"),
                validator: (value) {
                  if(value!.isEmpty || value.length < 20)
                    return "Veuillez entrer une adresse de facturation.";
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("S'inscrire"),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      String message = "Username: $_username\nEmail: $_email\nMot de passe: $_password\nAnnée de naissance: $_birthYear\nAdresse de facturation: $_address";
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text("Informations"),
                              content: Text(message)
                          );
                        }
                        );
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Annuler"),
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
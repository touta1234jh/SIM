import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/pages/signup.dart';
import 'package:workshop_4sim2_2526/pages/library.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Navigation vers la bibliothèque après authentification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Library()),
      );
    }
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Signup()),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Bannière Minecraft Dungeons
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/minecraft.jpg",
                    width: 460,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Champ Username
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre username';
                    }
                    return null;
                  },
                ),
              ),

              // Champ Mot de passe
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    return null;
                  },
                ),
              ),

              // Bouton S'authentifier
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _handleLogin,
                  child: const Text(
                    "S'authentifier",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Bouton Créer un compte
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[500],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _navigateToSignup,
                  child: const Text(
                    "Créer un compte",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Lien mot de passe oublié
              TextButton(
                onPressed: () {
                  // TODO: Implémenter la récupération de mot de passe
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Fonctionnalité à venir"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Mot de passe oublié ? ",
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Cliquez ici",
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


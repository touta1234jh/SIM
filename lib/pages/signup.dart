import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Inscription réussie !"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      // Retour à la page de connexion après 2 secondes
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    }
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _yearController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un username';
                    }
                    if (value.length < 3) {
                      return 'Le username doit contenir au moins 3 caractères';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Email invalide';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                      return 'Veuillez entrer un mot de passe';
                    }
                    if (value.length < 6) {
                      return 'Le mot de passe doit contenir au moins 6 caractères';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextFormField(
                  controller: _yearController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Année de naissance",
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre année de naissance';
                    }
                    final year = int.tryParse(value);
                    if (year == null || year < 1900 || year > DateTime.now().year) {
                      return 'Année invalide';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: TextFormField(
                  controller: _addressController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse de facturation",
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre adresse';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: _handleSignup,
                    child: const Text("S'inscrire"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: _handleCancel,
                    child: const Text("Annuler"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
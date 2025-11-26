import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    // This will run all validators and show error text under each field if invalid.
    if (_formKey.currentState!.validate()) {
      // All good: proceed with authentication logic (API call, navigation, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Authentification réussie (simulée)")),
      );
    } else {
      // Invalid: validators will display red error messages under the fields.
      // We can also optionally scroll to the first error, etc.
    }
  }

  OutlineInputBorder _defaultBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/minecraft.jpg",
            width: double.infinity,
            height: 215,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Username
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: _defaultBorder(Colors.grey),
                    enabledBorder: _defaultBorder(Colors.grey),
                    focusedBorder: _defaultBorder(Colors.blue),
                    errorBorder: _defaultBorder(Colors.red),
                    focusedErrorBorder: _defaultBorder(Colors.red),
                    // errorStyle default is red; you can customize:
                    errorStyle: const TextStyle(color: Colors.red),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le username ne doit pas être vide';
                    }
                    // Additional username validation can go here
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: _defaultBorder(Colors.grey),
                    enabledBorder: _defaultBorder(Colors.grey),
                    focusedBorder: _defaultBorder(Colors.blue),
                    errorBorder: _defaultBorder(Colors.red),
                    focusedErrorBorder: _defaultBorder(Colors.red),
                    errorStyle: const TextStyle(color: Colors.red),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 12.0),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le mot de passe ne doit pas être vide';
                    }
                    // Add more rules (min length, etc.) if needed
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Authenticate button (full width)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("S'authentifier"),
                  ),
                ),
                const SizedBox(height: 8),

                // Create account button (full width, red)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to signup page or implement creation logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Créer un compte"),
                  ),
                ),

                const SizedBox(height: 18),

                // Forgot password row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Mot de passe oublié ?"),
                    const SizedBox(width: 6),
                    TextButton(
                      onPressed: () {
                        // Forgot password action
                      },
                      child: const Text("Cliquez ici"),
                    )
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
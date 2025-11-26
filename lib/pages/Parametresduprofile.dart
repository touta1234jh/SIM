import 'package:flutter/material.dart';

class Parametresduprofile extends StatefulWidget {
  const Parametresduprofile({super.key});

  @override
  State<Parametresduprofile> createState() => _ParametresduprofileState();
}

class _ParametresduprofileState extends State<Parametresduprofile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _currentPwdController = TextEditingController();
  final TextEditingController _newPwdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _currentPwdController.dispose();
    _newPwdController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(4),
    );
  }

  void _onSave() {
    // Validate fields and show a summary dialog (replace with real save logic)
    if (_formKey.currentState!.validate()) {
      final actuel = _currentPwdController.text;
      final nouveau = _newPwdController.text;
      final adresse = _addressController.text;

      // Here you would call your API / save logic.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Informations enregistrées'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Mot de passe actuel: ${actuel.isNotEmpty ? "●●●●●●" : ""}'),
                Text('Nouveau mot de passe: ${nouveau.isNotEmpty ? "●●●●●●" : ""}'),
                const SizedBox(height: 8),
                Text('Adresse de facturation:\n$adresse'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // If invalid, the validators will show errors under each field.
      // You can also scroll to first error if desired.
    }
  }

  void _onReset() {
    _formKey.currentState?.reset();
    _currentPwdController.clear();
    _newPwdController.clear();
    _addressController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres du profil"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 12),
          Image.asset(
            "assets/images/minecraft.jpg",
            width: double.infinity,
            height: 215,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 18),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Mot de passe actuel
                TextFormField(
                  controller: _currentPwdController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Mot de passe actuel",
                    border: _border(Colors.grey),
                    enabledBorder: _border(Colors.grey),
                    focusedBorder: _border(Colors.blue),
                    errorBorder: _border(Colors.red),
                    focusedErrorBorder: _border(Colors.red),
                    errorStyle: const TextStyle(color: Colors.red),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le mot de passe ne doit pas être vide';
                    }
                    // Optionnel: vérifier correspondance avec le mot de passe actuel côté serveur
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Nouveau mot de passe
                TextFormField(
                  controller: _newPwdController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Nouveau mot de passe",
                    border: _border(Colors.grey),
                    enabledBorder: _border(Colors.grey),
                    focusedBorder: _border(Colors.blue),
                    errorBorder: _border(Colors.red),
                    focusedErrorBorder: _border(Colors.red),
                    errorStyle: const TextStyle(color: Colors.red),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le mot de passe ne doit pas être vide';
                    }
                    if (value.trim().length < 5) {
                      return 'Le mot de passe doit contenir au moins 5 caractères';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Adresse de facturation
                TextFormField(
                  controller: _addressController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Adresse de facturation",
                    alignLabelWithHint: true,
                    border: _border(Colors.grey),
                    enabledBorder: _border(Colors.grey),
                    focusedBorder: _border(Colors.blue),
                    errorBorder: _border(Colors.red),
                    focusedErrorBorder: _border(Colors.red),
                    errorStyle: const TextStyle(color: Colors.red),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "L'adresse de facturation ne doit pas être vide";
                    }
                    if (value.trim().length < 10) {
                      return "Veuillez entrer une adresse de facturation valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Enregistrer (full width)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Enregistrer'),
                  ),
                ),
                const SizedBox(height: 12),

                // Boutons basiques: Annuler
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: _onReset,
                      child: const Text('Annuler'),
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "G-STORE ESPRIT",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(), // Page d'authentification comme page d'accueil
    );
  }
}
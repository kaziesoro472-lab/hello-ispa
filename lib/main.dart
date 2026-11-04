import 'package:flutter/material.dart';

void main() {
  runApp(const HelloIspaApp());
}

class HelloIspaApp extends StatelessWidget {
  const HelloIspaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello ISPA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5A623)),
        useMaterial3: true,
      ),
      home: const AccueilPage(),
    );
  }
}

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _presents = 0;
  static const int _capacite = 30;

  bool get _complet => _presents >= _capacite;

  void _ajouterPresent() => setState(() => _presents++);
  void _reinitialiser() => setState(() => _presents = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello ISPA')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 80),
              const SizedBox(height: 16),
              Text(
                'Bienvenue au cours de développement mobile',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Étudiants présents : $_presents',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              if (_complet)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Salle complète',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _reinitialiser,
                child: const Text('Réinitialiser'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Université Polytechnique ISPA – Abidjan',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _complet ? null : _ajouterPresent,
        icon: const Icon(Icons.person_add),
        label: const Text('Je suis là'),
      ),
    );
  }
}
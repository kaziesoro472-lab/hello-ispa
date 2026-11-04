import 'package:flutter/material.dart';
 
void main() => runApp(const MonApp());
 
class Pharmacie {
  final String nom;
  final String commune;
  final String telephone;
  final bool deGarde;
 
  const Pharmacie({
    required this.nom,
    required this.commune,
    required this.telephone,
    this.deGarde = false,
  });
}
 
// Données fictives, en attendant Firestore (séance 4)
const pharmacies = [
  Pharmacie(nom: 'Pharmacie du Campus', commune: 'Cocody',
      telephone: '07 00 00 00 01', deGarde: true),
  Pharmacie(nom: 'Pharmacie de la Gare', commune: 'Adjamé',
      telephone: '07 00 00 00 02'),
  Pharmacie(nom: 'Pharmacie du Marché', commune: 'Yopougon',
      telephone: '07 00 00 00 03', deGarde: true),
  Pharmacie(nom: 'Pharmacie de la Lagune', commune: 'Marcory',
      telephone: '07 00 00 00 04'),
  Pharmacie(nom: 'Pharmacie Les Palmiers', commune: 'Abobo',
      telephone: '07 00 00 00 05', deGarde: true),
];
 
class MonApp extends StatelessWidget {
  const MonApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacies de garde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D5B)),
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
  bool _gardeSeulement = false;
 
  @override
  Widget build(BuildContext context) {
    final liste = _gardeSeulement
        ? pharmacies.where((p) => p.deGarde).toList()
        : pharmacies;
    final t = Theme.of(context).textTheme;
 
    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacies de garde')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text('${liste.length} pharmacies', style: t.titleMedium),
                ),
                const Text('De garde'),
                Switch(
                  value: _gardeSeulement,
                  onChanged: (v) => setState(() => _gardeSeulement = v),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, i) {
                final p = liste[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.local_pharmacy)),
                    title: Text(p.nom),
                    subtitle: Text('${p.commune} · ${p.telephone}'),
                    trailing: p.deGarde ? const Icon(Icons.nightlight_round) : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'payment_page.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Formations & Coaching"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          item(context, "Formation Flutter", "Débutant", "50 DT"),
          item(context, "Formation React", "Débutant", "50 DT"),
          item(context, "Formation Photoshop", "Débutant", "40 DT"),
          item(context, "Formation IA", "Débutant", "60 DT"),
          item(context, "Coaching PFE", "1 Séance", "30 DT"),
          item(context, "Marketing Digital", "Débutant", "45 DT"),
        ],
      ),
    );
  }

  Widget item(
      BuildContext context, String name, String pack, String price) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(pack),
        trailing: Text(price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentPage(
                game: name,
                package: pack,
                price: price,
                playerId: "",
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'payment_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Produits Physiques"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          item(context, "Casque Gaming", "Produit", "80 DT"),
          item(context, "Clavier Gaming", "Produit", "120 DT"),
          item(context, "Souris Gaming", "Produit", "50 DT"),
          item(context, "Montre Connectée", "Produit", "150 DT"),
          item(context, "Écouteurs Bluetooth", "Produit", "70 DT"),
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
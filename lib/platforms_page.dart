import 'package:flutter/material.dart';
import 'payment_page.dart';

class PlatformsPage extends StatelessWidget {
  const PlatformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Plateformes Pro"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          item(context, "Canva Pro", "1 Mois", "15 DT"),
          item(context, "ChatGPT Plus", "1 Mois", "75 DT"),
          item(context, "Netflix Premium", "1 Mois", "20 DT"),
          item(context, "Spotify Premium", "1 Mois", "12 DT"),
          item(context, "YouTube Premium", "1 Mois", "15 DT"),
          item(context, "CapCut Pro", "1 Mois", "18 DT"),
        ],
      ),
    );
  }

  Widget item(
    BuildContext context,
    String name,
    String pack,
    String price,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.amber,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading:  CircleAvatar(
          backgroundColor: Colors.amber,
           child: Text(
    name.substring(0, 1),
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          pack,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
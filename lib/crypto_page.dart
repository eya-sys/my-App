import 'package:flutter/material.dart';
import 'payment_page.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Cryptomonnaies"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          cryptoCard(context, "Bitcoin", "50 DT", "50 DT"),
          cryptoCard(context, "Bitcoin", "100 DT", "100 DT"),

          cryptoCard(context, "Ethereum", "50 DT", "50 DT"),
          cryptoCard(context, "Ethereum", "100 DT", "100 DT"),

          cryptoCard(context, "USDT TRC20", "50 DT", "50 DT"),
          cryptoCard(context, "USDT TRC20", "100 DT", "100 DT"),

          cryptoCard(context, "USDT BEP20", "50 DT", "50 DT"),
          cryptoCard(context, "USDT BEP20", "100 DT", "100 DT"),

          cryptoCard(context, "BNB", "50 DT", "50 DT"),
          cryptoCard(context, "BNB", "100 DT", "100 DT"),
        ],
      ),
    );
  }

  Widget cryptoCard(
    BuildContext context,
    String crypto,
    String amount,
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
            crypto.substring(0, 1),
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),   
        ),
        title: Text(
          crypto,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          amount,
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
                game: crypto,
                package: amount,
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
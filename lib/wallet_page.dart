import 'package:flutter/material.dart';
import 'payment_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Portefeuilles Électroniques"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          walletCard(context, "PayPal", "10 USD", "35 DT"),
          walletCard(context, "PayPal", "20 USD", "68 DT"),

          walletCard(context, "Skrill", "10 USD", "35 DT"),
          walletCard(context, "Skrill", "25 USD", "85 DT"),

          walletCard(context, "Wise", "20 USD", "70 DT"),

          walletCard(context, "Neteller", "10 USD", "35 DT"),

          walletCard(context, "Perfect Money", "10 USD", "35 DT"),
        ],
      ),
    );
  }

  Widget walletCard(
    BuildContext context,
    String wallet,
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
    wallet.substring(0, 1),
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
),
        title: Text(
          wallet,
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
                game: wallet,
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
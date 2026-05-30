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
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text(crypto),
        subtitle: Text(amount),
        trailing: Text(price),
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
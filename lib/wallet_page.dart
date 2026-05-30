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
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text(wallet),
        subtitle: Text(amount),
        trailing: Text(price),
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
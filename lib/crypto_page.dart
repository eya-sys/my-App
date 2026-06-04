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
    String imagePath;

if (crypto == "Bitcoin") {
  imagePath = "assets/images/bitcoin.png";
} else if (crypto == "Ethereum") {
  imagePath = "assets/images/etherum.png";
} else if (crypto.contains("USDT")) {
  imagePath = "assets/images/usdt.png";
} else {
  imagePath = "assets/images/bnb.webp";
}
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
        leading: Container(
  width: 55,
  height: 55,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: Colors.amber,
      width: 1.5,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.amber.withValues(alpha: 0.2),
        blurRadius: 8,
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
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
       trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
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
    const SizedBox(width: 10),
    const Icon(
      Icons.arrow_forward_ios,
      color: Colors.amber,
      size: 18,
    ),
  ],
),
      onTap: () {
  TextEditingController idController =
      TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF111111),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.amber,
            width: 1.2,
          ),
        ),
        title: Text(
          crypto,
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          controller: idController,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: "Player ID",
            hintStyle: const TextStyle(
              color: Colors.white54,
            ),
            filled: true,
            fillColor: const Color(0xFF1A1A1A),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.amber,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.amber,
                width: 2,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Annuler",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentPage(
                    game: crypto,
                    package: amount,
                    price: price,
                    playerId: idController.text.trim(),
                  ),
                ),
              );
            },
            child: const Text(
              "Continuer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
},
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'payment_page.dart';

class PlatformsPage extends StatelessWidget {
  const PlatformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Plateformes Pro TEST"),
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
    String imagePath;

if (name == "Canva Pro") {
  imagePath = "assets/images/canva.png";
} else if (name == "ChatGPT Plus") {
  imagePath = "assets/images/chatgpt.webp";
} else if (name == "Netflix Premium") {
  imagePath = "assets/images/netflix.png";
} else if (name == "Spotify Premium") {
  imagePath = "assets/images/spotify.jpg";
} else if (name == "YouTube Premium") {
  imagePath = "assets/images/youtube.jpg";
} else {
  imagePath = "assets/images/capcut.jpg";
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
            color: Colors.amber.withValues(alpha: 0.15),
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
          name,
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
                    game: name,
                    package: pack,
                    price: price,
                    playerId:
                        idController.text.trim(),
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
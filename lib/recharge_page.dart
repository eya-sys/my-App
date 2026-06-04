import 'package:flutter/material.dart';
import 'payment_page.dart';

class RechargePage extends StatelessWidget {
const RechargePage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
title: const Text(
  "Recharge Jeux",
  style: TextStyle(
        fontSize: 32,
    fontWeight: FontWeight.bold,
      color: Colors.amber,
    letterSpacing: 1,
  ),
),
backgroundColor: Colors.black,
foregroundColor: Colors.amber,
),
body: ListView(
padding: const EdgeInsets.all(20),
children: [
gameCard(context, "Free Fire", "100 Diamonds", "5 DT"),
gameCard(context, "Free Fire", "310 Diamonds", "12 DT"),
gameCard(context, "PUBG", "60 UC", "4 DT"),
gameCard(context, "PUBG", "325 UC", "18 DT"),
gameCard(context, "Valorant", "475 VP", "8 DT"),
],
),
);
}
Widget gameCard(
BuildContext context,
String game,
String pack,
String price,
) {
  String imagePath;

if (game == "Free Fire") {
  imagePath = "assets/images/freefire.png";
} else if (game == "PUBG") {
  imagePath = "assets/images/pubg.png";
} else {
  imagePath = "assets/images/valorant.png";
}
return Container(
margin: const EdgeInsets.only(bottom: 15),
decoration: BoxDecoration(
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF111111),
      Color(0xFF1A1A1A),
    ],
  ),
  borderRadius: BorderRadius.circular(20),
  border: Border.all(
    color: Colors.amber,
    width: 1.2,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.amber.withOpacity(0.15),
      blurRadius: 20,
      spreadRadius: 1,
      offset: const Offset(0, 5),
    ),
  ],
),
child: ListTile(
contentPadding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 4,
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
game,
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
    const Icon(
      Icons.arrow_forward_ios,
      color: Colors.amber,
      size: 18,
    ),
    const SizedBox(width: 12),

    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        price,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  ],
),
onTap: () {
final TextEditingController idController =
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
    game,
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

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),

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
      onPressed: () => Navigator.pop(context),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
  Navigator.pop(context);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PaymentPage(
        game: game,
        package: pack,
        price: price,
        playerId: idController.text,
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

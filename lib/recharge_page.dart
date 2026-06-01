import 'package:flutter/material.dart';
import 'payment_page.dart';

class RechargePage extends StatelessWidget {
const RechargePage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
title: const Text("Recharge Jeux"),
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
return Container(
margin: const EdgeInsets.only(bottom: 15),
decoration: BoxDecoration(
color: const Color(0xFF111111),
borderRadius: BorderRadius.circular(18),
border: Border.all(
color: Colors.amber,
width: 1.2,
),
),
child: ListTile(
contentPadding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 8,
),
leading: CircleAvatar(
backgroundColor: Colors.amber,
child: Text(
game.substring(0, 1),
style: const TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
fontSize: 20,
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
                width: 1,
              ),
            ),
            title: const Text(
              "Entrer votre ID",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextField(
              controller: idController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Player ID",
                hintStyle: TextStyle(
                  color: Colors.white54,
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
                    color: Colors.amber,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (idController.text.trim().isEmpty) {
                    return;
                  }

                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentPage(
                        game: game,
                        package: pack,
                        price: price,
                        playerId:
                            idController.text.trim(),
                      ),
                    ),
                  );
                },
                child: const Text("Continuer"),
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

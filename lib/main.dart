import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"title": "Games", "icon": Icons.sports_esports},
    {"title": "Recharge Mobile", "icon": Icons.phone_android},
    {"title": "Gift Cards", "icon": Icons.card_giftcard},
    {"title": "Wallet", "icon": Icons.account_balance_wallet},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accueil")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return Card(
              child: InkWell(
                onTap: () {
                  if (category["title"] == "Games") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServicesPage()),
                    );
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category["icon"], size: 50),
                    const SizedBox(height: 10),
                    Text(category["title"]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  final List<String> services = const [
    "Free Fire",
    "PUBG",
    "Mobile Legends",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Games Services")),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(services[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrderPage(service: services[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final String service;

  const OrderPage({super.key, required this.service});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController playerController = TextEditingController();

  final List<Map<String, String>> packages = [
    {"diamonds": "100 Diamonds", "price": "2\$"},
    {"diamonds": "300 Diamonds", "price": "5\$"},
    {"diamonds": "500 Diamonds", "price": "9\$"},
    {"diamonds": "1000 Diamonds", "price": "17\$"},
  ];

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  // ✅ الفنكشن الجديدة
  void sendOrderToWhatsApp(String diamonds, String price) async {
    if (playerController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter Player ID")),
      );
      return;
    }

    final message =
        "Service: ${widget.service}\n"
        "Player ID: ${playerController.text}\n"
        "Package: $diamonds\n"
        "Price: $price";

    final url = Uri.parse(
        "https://wa.me/21625654745?text=${Uri.encodeComponent(message)}");

    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.service),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: playerController,
              decoration: const InputDecoration(
                labelText: "Player ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Choose Package",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  final package = packages[index];

                  return Card(
                    child: ListTile(
                      title: Text(package["diamonds"]!),
                      subtitle: Text("Price: ${package["price"]}"),
                      trailing: const Icon(Icons.shopping_cart),
                      onTap: () {
                        sendOrderToWhatsApp(
                          package["diamonds"]!,
                          package["price"]!,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
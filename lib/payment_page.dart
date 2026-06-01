import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  final String game;
  final String package;
  final String price;
  final String playerId;

  const PaymentPage({
    super.key,
    required this.game,
    required this.package,
    required this.price,
    required this.playerId,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedMethod;

  late TextEditingController idController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    idController = TextEditingController(
      text: widget.playerId,
    );

    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    idController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> sendOrderToWhatsApp() async {
    if (idController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Remplissez tous les champs"),
        ),
      );
      return;
    }

    if (selectedMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Choisissez une méthode de paiement"),
        ),
      );
      return;
    }

    const String phone = "21625654745";

    String message =
        "BEN AMMAR STORE\n\n"
        "Service: ${widget.game}\n"
        "Compte: ${idController.text.trim()}\n"
        "Téléphone: ${phoneController.text.trim()}\n"
        "Offre: ${widget.package}\n"
        "Prix: ${widget.price}\n"
        "Paiement: $selectedMethod";

    final Uri url = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Widget paymentButton(String method) {
    final bool isSelected = selectedMethod == method;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedMethod = method;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.amber : const Color(0xFF1A1A1A),
          foregroundColor:
              isSelected ? Colors.black : Colors.white,
          padding:
              const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          method,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  InputDecoration fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.amber,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.amber,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.amber,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        title: const Text("Paiement"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.amber,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Résumé de la commande",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "Service : ${widget.game}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Offre : ${widget.package}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: idController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: fieldDecoration(
                "Email / ID / Numéro",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: fieldDecoration(
                "Numéro de téléphone",
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Méthode de paiement",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            paymentButton("💳 eDinar"),
            const SizedBox(height: 12),

            paymentButton("📱 Flouci"),
            const SizedBox(height: 12),

            paymentButton("🏦 Carte Bancaire"),
            const SizedBox(height: 12),

            paymentButton("🚚 Paiement à la livraison"),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text(
                  "Envoyer sur WhatsApp",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: sendOrderToWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  side: 
                       const BorderSide(
                    color: Colors.amber,
                  width: 1,
                 ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
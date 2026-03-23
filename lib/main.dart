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
      title: 'BEN AMMAR STORE',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool isLoading = false;

  Future<void> loginWithEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    setState(() => isLoading = false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  Future<void> openExternalLogin(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Veuillez saisir votre email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Mot de passe minimum 6 caractères";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          /// DARK OVERLAY
          Positioned.fill(
            child: Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/bg.jpeg"),
      fit: BoxFit.cover,
    ),
  ),
),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  child: Column(
                    children: [
                      /// LOGO
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber),
                        ),
                        child: Image.asset(
                          "assets/images/logo.jpeg",
                          height: 150,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Bienvenue",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Connectez-vous pour continuer",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 28),

                      /// LOGIN BOX
                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                validator: validateEmail,
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: passwordController,
                                obscureText: obscurePassword,
                                validator: validatePassword,
                                decoration: const InputDecoration(
                                  labelText: "Mot de passe",
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed:
                                      isLoading ? null : loginWithEmail,
                                  child: const Text("Se connecter"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  openExternalLogin(
                                      "https://accounts.google.com/");
                                },
                                icon: const Icon(Icons.g_mobiledata),
                                label: const Text("Google"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
      appBar: AppBar(
        title: const Text("BEN AMMAR STORE"),
        SizedBox(height: 20),

Image.asset(
  "assets/images/logo.jpeg",
  height: 160,
),

SizedBox(height: 20),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return Card(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category["icon"], size: 50, color: Colors.amber),
                const SizedBox(height: 10),
                Text(
                  category["title"],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
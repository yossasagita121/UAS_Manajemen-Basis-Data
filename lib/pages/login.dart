import 'package:e_kost/pages/daftar.dart';
import 'package:e_kost/providers/favorite_provider.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final transactionProvider = Provider.of<TransactionProvider>(context);
      transactionProvider.clearTransaction();
      transactionProvider.initDataTransaction();

      final kamarProvider = Provider.of<KamarProvider>(context);
      kamarProvider.clearKamar();
      kamarProvider.initDataKamar();

      final kostProvider = Provider.of<KostProvider>(context);
      kostProvider.clearKost();
      kostProvider.initDataKost();

      final favoriteProvider = Provider.of<FavoriteProvider>(context);
      favoriteProvider.clearFavorite();
      favoriteProvider.initDataFavorite();

      final userProvider = Provider.of<UserProvider>(context);
      userProvider.clearUser();
      userProvider.initDataUser().then((value) => isInit = false);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "E-Kost",
                    style: GoogleFonts.signika(
                      textStyle: const TextStyle(
                        color: Color(0xff01b399),
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Image.asset('images/login.jpg'),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          "Login terlebih dahulu!",
                          style: GoogleFonts.signika(
                            textStyle: const TextStyle(
                              color: Color(0xff01b399),
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextField(
                          autofocus: false,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Color(0xff01b399),
                            ),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Color(0xff01b399),
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Belum punya akun?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 110, 110, 110)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Daftar.routeName);
                              },
                              child: const Text("Daftar Disini!"),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              userProvider.login(emailController.text,
                                  passwordController.text, context);
                              // Navigator.pushReplacementNamed(
                              //     context, Home.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: const Color(0xff01b399),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

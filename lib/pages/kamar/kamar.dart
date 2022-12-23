import 'package:e_kost/models/kamar_model.dart';
import 'package:e_kost/pages/checkout_splash.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Kamar extends StatefulWidget {
  static const routeName = "/kamar";

  @override
  State<Kamar> createState() => _KamarState();
}

class _KamarState extends State<Kamar> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      final kamarProvider = Provider.of<KamarProvider>(context);
      kamarProvider.clearKamar();
      kamarProvider.initDataKamar().then((value) => isInit = false);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final idKost = ModalRoute.of(context)!.settings.arguments as String;
    final kamarProvider = Provider.of<KamarProvider>(context);
    final kamar = kamarProvider.byAvailable(idKost);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: const Text("Kamar Kost"),
      ),
      body: (isInit)
          ? Center(
              child: Lottie.asset(
                'lotties/loading.json',
                width: 100,
                height: 100,
              ),
            )
          : KamarBuilder(kamar: kamar),
    );
  }
}

class KamarBuilder extends StatelessWidget {
  const KamarBuilder({
    Key? key,
    required this.kamar,
  }) : super(key: key);

  final Iterable<KamarModel> kamar;

  @override
  Widget build(BuildContext context) {
    final kamarProvider = Provider.of<KamarProvider>(context);

    return ChangeNotifierProvider(
      create: ((context) => kamarProvider),
      child: ListView.builder(
        itemCount: kamar.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "No Kamar : ${kamar.elementAt(index).no}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 20,
                                child: Text(
                                  "Luas",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 20,
                                child: Text(
                                  kamar.elementAt(index).luas,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 20,
                                child: Text(
                                  "Harga",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 129, 4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 20,
                                child: Text(
                                  "Rp ${kamar.elementAt(index).harga}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 129, 4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 20,
                                child: Text(
                                  "Air",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 124, 226),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 20,
                                child: Text(
                                  "Rp ${kamar.elementAt(index).air}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 124, 226),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 20,
                                child: Text(
                                  "Listrik",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 20,
                                child: Text(
                                  "Rp ${kamar.elementAt(index).listrik}",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Lottie.asset(
                              'lotties/kamar1.json',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(
                              width: 67,
                              height: 28,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 221, 65, 54),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    CheckoutSplash.routeName,
                                    arguments: kamar.elementAt(index).id,
                                  );
                                },
                                child: const Text(
                                  "Pesan",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

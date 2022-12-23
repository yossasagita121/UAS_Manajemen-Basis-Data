import 'package:e_kost/models/kamar_model.dart';
import 'package:e_kost/pages/kamar/kamar_add.dart';
import 'package:e_kost/pages/kamar/kamar_edit.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class KamarManage extends StatefulWidget {
  static const routeName = "/kamarManage";

  @override
  State<KamarManage> createState() => _KamarManageState();
}

class _KamarManageState extends State<KamarManage> {
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
    final kamar = kamarProvider.byIdKost(idKost);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: const Text("Kamar Kost"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(KamarAdd.routeName, arguments: idKost);
              },
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
        ],
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

  final List<KamarModel> kamar;

  @override
  Widget build(BuildContext context) {
    final kamarProvider = Provider.of<KamarProvider>(context);
    final penghuni = Provider.of<UserProvider>(context);

    return ChangeNotifierProvider(
      create: ((context) => kamarProvider),
      child: ListView.builder(
        itemCount: kamar.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
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
                                width: 60,
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
                                width: 160,
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
                                width: 60,
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
                                width: 60,
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
                                width: 60,
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 60,
                                height: 20,
                                child: Text(
                                  "Penghuni",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
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
                              Container(
                                // width: 100,
                                height: 38,
                                alignment: Alignment.centerLeft,
                                child: (kamar.elementAt(index).idUser != "")
                                    ? Row(
                                        children: [
                                          Text(
                                            penghuni
                                                .byId(kamar
                                                    .elementAt(index)
                                                    .idUser)
                                                .nama,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              kamarProvider
                                                  .editKamarUser(
                                                kamar.elementAt(index).id,
                                                "",
                                              )
                                                  .then((value) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "Penghuni berhasil dihapus!"),
                                                    duration:
                                                        Duration(seconds: 2),
                                                  ),
                                                );
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        // width: 100,
                                        height: 38,
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "-",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                KamarEdit.routeName,
                                arguments: kamar.elementAt(index).id,
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 230, 207, 0),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              kamarProvider
                                  .deleteKamar(kamar.elementAt(index).id)
                                  .then(
                                (value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data berhasil dihapus!"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      )
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

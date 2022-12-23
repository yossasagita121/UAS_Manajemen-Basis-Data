import 'package:e_kost/providers/kamar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KamarAdd extends StatelessWidget {
  const KamarAdd({super.key});
  static const routeName = '/kamarAdd';

  @override
  Widget build(BuildContext context) {
    final TextEditingController noController = TextEditingController();
    final TextEditingController hargaController = TextEditingController();
    final TextEditingController airController = TextEditingController();
    final TextEditingController listrikController = TextEditingController();
    final TextEditingController luasController = TextEditingController();
    final idKost = ModalRoute.of(context)!.settings.arguments as String;
    final kamarProvider = Provider.of<KamarProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => KamarProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tambah Kamar"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: noController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.numbers_outlined),
                        labelText: "Nomor Kamar",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: hargaController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.attach_money),
                        labelText: "Harga / Bulan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: airController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.water_drop),
                        labelText: "Air/Bulan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: listrikController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.electric_bolt),
                        labelText: "Listrik / Bulan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: luasController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.meeting_room),
                        labelText: "Luas Kamar",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          kamarProvider
                              .addKamar(
                            idKost,
                            noController.text,
                            hargaController.text,
                            airController.text,
                            listrikController.text,
                            luasController.text,
                          )
                              .then(
                            (value) {
                              kamarProvider.clearKamar();
                              kamarProvider.initDataKamar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data berhasil ditambahkan!"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff01b399),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

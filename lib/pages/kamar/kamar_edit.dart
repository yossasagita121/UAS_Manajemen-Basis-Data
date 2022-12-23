import 'package:e_kost/providers/kamar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KamarEdit extends StatelessWidget {
  const KamarEdit({super.key});
  static const routeName = '/kamarEdit';

  @override
  Widget build(BuildContext context) {
    final idKamar = ModalRoute.of(context)!.settings.arguments as String;
    final kamarProvider = Provider.of<KamarProvider>(context);
    final kamar = kamarProvider.byId(idKamar);

    final TextEditingController noController =
        TextEditingController(text: kamar.no);
    final TextEditingController hargaController =
        TextEditingController(text: kamar.harga);
    final TextEditingController airController =
        TextEditingController(text: kamar.air);
    final TextEditingController listrikController =
        TextEditingController(text: kamar.listrik);
    final TextEditingController luasController =
        TextEditingController(text: kamar.luas);

    return ChangeNotifierProvider(
      create: (context) => KamarProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Kamar"),
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
                        labelText: "Air / Bulan",
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
                              .editKamar(
                            kamar.id,
                            kamar.idUser,
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
                                  content: Text("Data berhasil diubah!"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pop(context);
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

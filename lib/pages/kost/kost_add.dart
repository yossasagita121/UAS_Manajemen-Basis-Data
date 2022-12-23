import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KostAdd extends StatelessWidget {
  const KostAdd({super.key});
  static const routeName = '/kostAdd';

  @override
  Widget build(BuildContext context) {
    final kostProvider = Provider.of<KostProvider>(context);
    final idUser = Provider.of<UserProvider>(context).byLogin().id;

    final TextEditingController namaController = TextEditingController();
    final TextEditingController noController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();
    final TextEditingController deskripsiController = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => KostProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tambah Kost"),
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
                      controller: namaController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home),
                        labelText: "Nama Kost",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: noController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.numbers_outlined),
                        labelText: "Nomor Rumah",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: alamatController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_pin),
                        labelText: "Alamat",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      controller: deskripsiController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.description),
                        labelText: "Deskripsi",
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
                          kostProvider
                              .addKost(
                            idUser,
                            namaController.text,
                            noController.text,
                            alamatController.text,
                            deskripsiController.text,
                          )
                              .then(
                            (value) {
                              kostProvider.clearKost();
                              kostProvider.initDataKost();
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
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: const Color(0xff01b399),
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

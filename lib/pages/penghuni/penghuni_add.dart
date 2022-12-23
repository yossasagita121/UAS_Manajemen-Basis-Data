import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/penghuni_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PenghuniAdd extends StatelessWidget {
  const PenghuniAdd({super.key});
  static const routeName = '/penghuniAdd';

  @override
  Widget build(BuildContext context) {
    final idKamar = ModalRoute.of(context)!.settings.arguments as String;
    final kamarProvider = Provider.of<KamarProvider>(context);
    final idKost = kamarProvider.byId(idKamar).idKost;

    final penghuniProvider = Provider.of<PenghuniProvider>(context);

    final TextEditingController namaController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();
    final TextEditingController teleponController = TextEditingController();
    final TextEditingController pekerjaanController = TextEditingController();

    return ChangeNotifierProvider(
      create: ((context) => penghuniProvider),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tambah Penghuni"),
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
                        prefixIcon: const Icon(Icons.abc),
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
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
                      textInputAction: TextInputAction.next,
                      controller: teleponController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.call),
                        labelText: "Telepon",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      controller: pekerjaanController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.design_services),
                        labelText: "Pekerjaan",
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
                          penghuniProvider
                              .addPenghuni(
                            idKost,
                            idKamar,
                            namaController.text,
                            emailController.text,
                            alamatController.text,
                            teleponController.text,
                            pekerjaanController.text,
                          )
                              .then(
                            (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Data berhasil ditambahkan!"),
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

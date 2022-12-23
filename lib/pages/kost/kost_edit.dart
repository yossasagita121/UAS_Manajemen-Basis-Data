import 'package:e_kost/providers/kost_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KostEdit extends StatelessWidget {
  const KostEdit({super.key});
  static const routeName = '/kostEdit';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final kostProvider = Provider.of<KostProvider>(context);
    final kost = Provider.of<KostProvider>(context).byId(id);

    final TextEditingController namaController =
        TextEditingController(text: kost.nama);
    final TextEditingController noController =
        TextEditingController(text: kost.no);
    final TextEditingController alamatController =
        TextEditingController(text: kost.alamat);
    final TextEditingController deskripsiController =
        TextEditingController(text: kost.deskripsi);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Kost"),
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
                            .editKost(
                          kost.id,
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
    );
  }
}

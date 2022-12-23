import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LaporanIndex extends StatefulWidget {
  const LaporanIndex({super.key});
  static const routeName = '/laporanIndex';

  @override
  State<LaporanIndex> createState() => _LaporanIndexState();
}

class _LaporanIndexState extends State<LaporanIndex> {
  @override
  Widget build(BuildContext context) {
    final idTransaction = ModalRoute.of(context)!.settings.arguments as String;
    final transaction =
        Provider.of<TransactionProvider>(context).byId(idTransaction);

    final userProvider = Provider.of<UserProvider>(context);

    final kost = Provider.of<KostProvider>(context).byId(transaction.idKost);
    final kamar = Provider.of<KamarProvider>(context).byId(transaction.idKamar);
    final pemilik = userProvider.byId(kost.idUser);
    final pemesan = userProvider.byId(transaction.idUser);

    final dateInDate = DateTime.parse(transaction.dateIn);
    final dateOutDate = DateTime.parse(transaction.dateOut);

    final days = dateOutDate.difference(dateInDate).inDays;
    int air = int.parse(kamar.air) * days ~/ 30;
    int listrik = int.parse(kamar.listrik) * days ~/ 30;
    int harga = int.parse(kamar.harga) * days ~/ 30;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => TransactionProvider(),
        child: SafeArea(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Detail pesanan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "ID ${transaction.idTransaction}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Kost",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    kost.nama,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    kost.alamat,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "No Kamar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                kamar.no,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Pemilik Kost",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    pemilik.nama,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    pemilik.email,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Atas Nama",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    pemesan.nama,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    pemesan.email,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 112, 112, 112),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tanggal Masuk",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(DateTime.parse(transaction.dateIn)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tanggal Keluar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMEd().format(
                                    DateTime.parse(transaction.dateOut)),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Air",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Rp $air",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Listrik",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Rp $listrik",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Kamar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Rp $harga",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total Biaya",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Rp ${transaction.total}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Metode Bayar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.payment,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    transaction.metodeBayar,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 95, 95, 95),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tanggal Transaksi",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMEd().format(
                                    DateTime.parse(transaction.createdAt)),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color.fromARGB(255, 95, 95, 95),
                            height: 2,
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

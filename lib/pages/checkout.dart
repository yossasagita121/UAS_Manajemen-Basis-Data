import 'package:e_kost/pages/success_splash.dart';
import 'package:e_kost/providers/kamar_provider.dart';
import 'package:e_kost/providers/kost_provider.dart';
import 'package:e_kost/providers/transaction_provider.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});
  static const routeName = '/checkout';

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  DateTime dateInDate = DateTime.now();
  DateTime dateOutDate = DateTime.now();
  String dateIn = "";
  String dateOut = "";
  int harga = 0;
  int air = 0;
  int listrik = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    final idKamar = ModalRoute.of(context)!.settings.arguments as String;

    final transactionProvider = Provider.of<TransactionProvider>(context);

    final kamarProvider = Provider.of<KamarProvider>(context);
    final kamar = kamarProvider.byId(idKamar);

    final kostProvider = Provider.of<KostProvider>(context);
    final kost = kostProvider.byId(kamar.idKost);

    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.byLogin();
    final pemilik = userProvider.byId(kost.idUser);

    final TextEditingController dateInController =
        TextEditingController(text: dateIn);
    final TextEditingController dateOutController =
        TextEditingController(text: dateOut);

    return Scaffold(
      backgroundColor: Colors.teal,
      body: ChangeNotifierProvider(
        create: (context) => TransactionProvider(),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              "Proses pesanan anda sekarang!",
                              style: TextStyle(
                                fontSize: 23,
                                color: Color.fromARGB(255, 241, 241, 241),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
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
                                "ID #${DateTime.now()}",
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
                                    user.nama,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    user.email,
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
                          TextField(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    setState(() {
                                      dateIn =
                                          DateFormat.yMMMEd().format(value);
                                      dateInDate = value;
                                    });
                                  }
                                },
                              );
                            },
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            textInputAction: TextInputAction.next,
                            controller: dateInController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range),
                              labelText: "Tanggal Masuk",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2030),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    setState(() {
                                      dateOut =
                                          DateFormat.yMMMEd().format(value);
                                      dateOutDate = value;
                                      final days = dateOutDate
                                          .difference(dateInDate)
                                          .inDays;
                                      air = int.parse(kamar.air) * days ~/ 30;
                                      listrik =
                                          int.parse(kamar.listrik) * days ~/ 30;
                                      harga =
                                          int.parse(kamar.harga) * days ~/ 30;
                                      total = air + listrik + harga;
                                    });
                                  }
                                },
                              );
                            },
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            textInputAction: TextInputAction.next,
                            controller: dateOutController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range),
                              labelText: "Tanggal Keluar",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Biaya pesanan anda",
                            style: TextStyle(
                              color: Color.fromARGB(255, 95, 95, 95),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 15),
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
                          const SizedBox(height: 15),
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
                                "Rp $total",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
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
                                "Metode Bayar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.payment,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    "Cash",
                                    style: TextStyle(
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
                                DateFormat.yMMMEd()
                                    .format(DateTime.now())
                                    .toString(),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Peringatan : pesanan tidak dapat dibatalkan",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 88, 88, 88),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity, // <-- Your width
                                height: 40, // <-- Your height
                                child: ElevatedButton(
                                  onPressed: () {
                                    kamarProvider.editKamar(
                                      idKamar,
                                      user.id,
                                      kamar.no,
                                      kamar.harga,
                                      kamar.air,
                                      kamar.listrik,
                                      kamar.luas,
                                    );
                                    transactionProvider.addTransaction(
                                      kamar.idKost,
                                      idKamar,
                                      user.id,
                                      dateInDate.toString(),
                                      dateOutDate.toString(),
                                      total.toString(),
                                    );
                                    Navigator.of(context)
                                        .pushNamed(SuccessSplash.routeName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 211, 14, 0)),
                                  child: const Text("Bayar Sekarang"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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

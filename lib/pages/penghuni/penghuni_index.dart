import 'package:e_kost/pages/login.dart';
import 'package:flutter/material.dart';

class PenghuniIndex extends StatefulWidget {
  const PenghuniIndex({super.key});
  static const routeName = '/penghuniIndex';

  @override
  State<PenghuniIndex> createState() => _PenghuniIndexState();
}

class _PenghuniIndexState extends State<PenghuniIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const Text(
                            "Profile Penghuni",
                            style: TextStyle(fontSize: 23, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 250,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/login.jpg",
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          readOnly: true,
                          controller:
                              TextEditingController(text: "Yoss Sagita"),
                          decoration: const InputDecoration(
                            labelText: "Nama",
                            labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          readOnly: true,
                          controller: TextEditingController(
                            text: "sagitayoss121@gmail.com",
                          ),
                          decoration: const InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          readOnly: true,
                          controller:
                              TextEditingController(text: "0812345678910"),
                          decoration: const InputDecoration(
                            labelText: "Telepon",
                            labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          readOnly: true,
                          controller:
                              TextEditingController(text: "0812345678910"),
                          decoration: const InputDecoration(
                            labelText: "Telepon",
                            labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          readOnly: true,
                          controller:
                              TextEditingController(text: "0812345678910"),
                          decoration: const InputDecoration(
                            labelText: "Telepon",
                            labelStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
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

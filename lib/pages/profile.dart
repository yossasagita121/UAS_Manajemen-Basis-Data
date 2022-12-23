import 'package:e_kost/pages/login.dart';
import 'package:e_kost/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.byLogin();

    final TextEditingController namaController =
        TextEditingController(text: user.nama);
    final TextEditingController emailController =
        TextEditingController(text: user.email);
    final TextEditingController teleponController =
        TextEditingController(text: user.telepon);
    final TextEditingController alamatController =
        TextEditingController(text: user.alamat);
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            edit = !edit;
          });
        },
        backgroundColor: const Color(0xff01b399),
        child: (edit) ? const Icon(Icons.arrow_back) : const Icon(Icons.edit),
      ),
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
                            "Profile",
                            style: TextStyle(fontSize: 23, color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 211, 36, 24),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Apakah anda ingin logout?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Tidak"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  Login.routeName);
                                        },
                                        child: const Text("Ya"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
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
                        (edit)
                            ? TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Update Photo",
                                  style: TextStyle(
                                      color: Color(0xff01b399),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : const SizedBox(),
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
                          readOnly: (edit) ? false : true,
                          controller: namaController,
                          decoration: InputDecoration(
                            labelText: (edit) ? "Nama (required)" : "Nama",
                            labelStyle: const TextStyle(
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
                          readOnly: (edit) ? false : true,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: (edit) ? "Email (required)" : "Email",
                            labelStyle: const TextStyle(
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
                          readOnly: (edit) ? false : true,
                          controller: teleponController,
                          decoration: InputDecoration(
                            labelText:
                                (edit) ? "Telepon (required)" : "Telepon",
                            labelStyle: const TextStyle(
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
                          readOnly: (edit) ? false : true,
                          controller: alamatController,
                          decoration: InputDecoration(
                            labelText: (edit) ? "Alamat (required)" : "Alamat",
                            labelStyle: const TextStyle(
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
                        (edit)
                            ? Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      obscureText: true,
                                      readOnly: (edit) ? false : true,
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                        labelText: "Current Password",
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
                                      obscureText: true,
                                      readOnly: (edit) ? false : true,
                                      controller: newPasswordController,
                                      decoration: const InputDecoration(
                                        labelText: "New Passoword",
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
                                    const SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        String password = "";
                                        if (passwordController.text == "" &&
                                            newPasswordController.text == "") {
                                          password = user.password;
                                        } else {
                                          if (passwordController.text ==
                                                  user.password &&
                                              newPasswordController.text !=
                                                  "") {
                                            password =
                                                newPasswordController.text;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Password tidak sesuai!"),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            return;
                                          }
                                        }
                                        userProvider
                                            .editUser(
                                          user.id,
                                          namaController.text,
                                          emailController.text,
                                          teleponController.text,
                                          alamatController.text,
                                          password,
                                        )
                                            .then(
                                          (value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Profile berhasil diubah!"),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            edit = false;
                                          },
                                        );
                                      },
                                      child: const Text("Save"),
                                    ),
                                    const SizedBox(height: 85),
                                  ],
                                ),
                              )
                            : const SizedBox(),
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

import 'package:dhea_fb/home/ctrl.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/list_product.dart';
import 'package:dhea_fb/home/dashboard/dashboard_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  bool _passVisibility = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('LogIn Admin'),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        // padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/dheasa-fb.appspot.com/o/decoration%2F37f3b3007dce94a3d40832c876c85133.jpg?alt=media&token=63c4a371-ea7f-4260-aea4-abc07e6df07b'),
              // colorFilter: ColorFilter.mode(
              //   // Colors.white,
              //   BlendMode.darken,
              // ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/dheasa-fb.appspot.com/o/decoration%2Fwedding%20nikah%20yuk%20logo.png?alt=media&token=c5ba537b-02e4-4fb5-95dc-acb31fee9162'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    autofocus: false,
                    controller: ct.adminEmail,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Masukan email',
                      border: OutlineInputBorder(),
                      labelText: 'Masukan email',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "password required";
                      }
                      return null;
                    },
                    controller: ct.adminPassword,
                    obscureText: _passVisibility,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Masukan Password',
                      border: const OutlineInputBorder(),
                      labelText: 'masukan password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _passVisibility = !_passVisibility;

                          setState(() {});
                        },
                        icon: _passVisibility ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    User? user = await ct.signInAdmin(context);

                    if (user != null) {
                      debugPrint('Admin ditemukan');

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListProduct(),
                          ));
                    } else {
                      final snackbar = SnackBar(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                        behavior: SnackBarBehavior.floating,
                        content: const Text(
                          'Admin Tidak Ditemukan !!',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: (Colors.white),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          textColor: Colors.black,
                          onPressed: () {},
                        ),
                      );

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  child: const Text(
                    "LogIn",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

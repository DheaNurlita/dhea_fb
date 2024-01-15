import 'package:dhea_fb/home/ctrl.dart';
import 'package:dhea_fb/home/login/login_admin.dart';
import 'package:dhea_fb/home/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatelessWidget {
  const LoginUser({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final emailLogin = TextEditingController();
    // final passwordLogin = TextEditingController();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginAdmin()),
                );
              },
              child: const Text('Admin'),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              // width: 300,
              height: height,
              // color: const Color.fromARGB(255, 244, 210, 222),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/dheasa-fb.appspot.com/o/decoration%2F37f3b3007dce94a3d40832c876c85133.jpg?alt=media&token=63c4a371-ea7f-4260-aea4-abc07e6df07b'),
                    fit: BoxFit.fitWidth),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Git Hub",
                      ),
                    ),
                    const SizedBox(height: 30),

                    // TextField(
                    //   controller: ct.emailCtrl,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Masukan Email',
                    //     border: OutlineInputBorder(),
                    //     labelText: 'masukan Email',
                    //   ),
                    // ),
                    // const SizedBox(height: 30),
                    // TextField(
                    //   controller: ct.passwordCtrl,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Masukan password',
                    //     border: OutlineInputBorder(),
                    //     labelText: 'masukan password',
                    //   ),
                    // ),
                    StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) => Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  await ct.signInAnon(context);
                                },
                                child: const Text(
                                  "Sign in as Guest",
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  await ct.signInGoogle(context);
                                },
                                child: const Text(
                                  "Sign In Google ",
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text("Don't Have Any Account ?"),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegisterView()),
                                  );
                                },
                                child: const Text('Register'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    // const RegisterView(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

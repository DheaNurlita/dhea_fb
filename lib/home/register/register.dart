import 'package:dhea_fb/home/ctrl.dart';
import 'package:dhea_fb/home/models.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(70),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: ct.nameCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Masukan nama',
                    border: OutlineInputBorder(),
                    labelText: 'masukan nama',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: ct.emailCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Masukan Email',
                    border: OutlineInputBorder(),
                    labelText: 'masukan Email',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: ct.passwordCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Masukan password',
                    border: OutlineInputBorder(),
                    labelText: 'masukan password',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    final valNama = ct.nameCtrl.text;
                    final valEmail = ct.emailCtrl.text;
                    final valPassword = ct.passwordCtrl.text;
                    final valCreatedAt = DateTime.now();
                    final id = UniqueKey().toString();

                    final valRegist = UserX(
                        createdAt: valCreatedAt.toString(),
                        email: valEmail,
                        id: id,
                        nama: valNama,
                        password: valPassword);
                    await ct.create(valRegist, context);
                  },
                  child: const Text(
                    "Regist",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

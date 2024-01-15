import 'package:dhea_fb/home/dashboard/add_paket/widget/paket_satuan.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Admin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaketSatuanView(),
                      ));
                },
                child: const Text(
                  "Tambah Paket satuan",
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Tambah Paketan",
                ),
              ),
            ],
          ),
        ));
  }
}

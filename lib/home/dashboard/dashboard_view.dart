import 'package:flutter/material.dart';

class DashboardUser extends StatelessWidget {
  const DashboardUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard user'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 249,
              decoration: const BoxDecoration(color: Color(0xA5F9E1E0)),
            )
          ],
        ));
  }
}

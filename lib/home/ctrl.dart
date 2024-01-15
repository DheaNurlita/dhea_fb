import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhea_fb/home/dashboard/dashboard_admin.dart';
import 'package:dhea_fb/home/dashboard/dashboard_view.dart';
import 'package:dhea_fb/home/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final ct = Ctrl();

class Ctrl {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final adminEmail = TextEditingController();
  final adminPassword = TextEditingController();

  Future<User?> signInAdmin(context) async {
    String emailAdmin = adminEmail.text;
    String passwordAdmin = adminPassword.text;
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAdmin, password: passwordAdmin);
      return credential.user;
    } catch (e) {
      debugPrint('admin Tidak ditemukan');
    }
    return null;
  }

  Future create(UserX user, context) async {
    final mapUser = user.toMap();
    final nama = user.nama;
    // final email = user.email;
    final password = user.password;
    // final createdAt = user.createdAt;
    final id = user.id;
    await FirebaseFirestore.instance.collection('user detail').doc(id).set(mapUser);
    await FirebaseFirestore.instance.collection('user').doc(id).set({'nama': nama, 'password': password});

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardUser()),
    );
  }

  Future signInAnon(context) async {
    final anon = await FirebaseAuth.instance.signInAnonymously();
    debugPrint('Id nya adalah : ${anon.user?.uid}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardUser()),
    );
  }

  Future signInGoogle(context) async {
    final auth = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
    await FirebaseAuth.instance.signInWithPopup(auth);
    // debugPrint('Id nya adalah : ${anon.user?.uid}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardAdmin()),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:dhea_fb/home/dashboard/add_paket/data_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/model.dart';

final cs = CtrlStorage();

class CtrlStorage {
  editStorage(String id) async {
    final data = await pickedImage!.readAsBytes();
    final metadata = SettableMetadata(contentType: typePhoto);
    final putData = await FirebaseStorage.instance.ref('edited/$id').putData(data, metadata);
    imageUrl = await putData.ref.getDownloadURL();
    return putData.toString();
  }

  uploadStorage() async {
    final data = await pickedImage!.readAsBytes();
    final metadata = SettableMetadata(contentType: typePhoto);

    final putData = await FirebaseStorage.instance.ref(namaPhoto).putData(data, metadata);
    imageUrl = await putData.ref.getDownloadURL();
    pickedImage = null;
    return imageUrl;
  }

  deleteImage() async {
    await FirebaseStorage.instance.ref(namaPhoto).delete();
  }
}

final cd = CtrlData();

class CtrlData {
  final judul = TextEditingController();
  final deskripsi = TextEditingController();
  final harga = TextEditingController();

  Future createPaketSatuan(ModelPaket objekProduk) async {
    final product = objekProduk.toMap();
    final id = objekProduk.id;
    await FirebaseFirestore.instance.collection('product satuan').doc(id).set(
          product,
        );
  }

  Future<List<ModelPaket>> listProduct() async {
    List<ModelPaket> users = [];
    final result = await FirebaseFirestore.instance
        .collection('product satuan')
        .orderBy(
          'created_at',
          descending: true,
        )
        .limit(limit)
        .startAfter([userList.isEmpty ? '9999-99-99' : userList.last.createdAt]).get();
    for (var element in result.docs) {
      users.add(ModelPaket.fromMap(element.data()));
    }
    return users;
  }

  loading() async {
    final collection = await listProduct();
    userList.addAll(collection);
    if (collection.length < limit) {
      isEnd = true;
    }
  }

  Future<ModelPaket> getDoc(String id) async {
    final result = await FirebaseFirestore.instance.collection('product satuan').doc(id).get();
    var user = ModelPaket.fromMap(result.data() ?? {});
    return user;
  }

  Future delete(String id) async {
    var docId = id;
    await FirebaseFirestore.instance.collection('product satuan').doc(docId).delete();
    final index = userList.indexWhere((element) => element.id == id);
    userList.removeAt(index);
  }

  void updateProduct(ModelPaket rxProduct) async {
    final product = rxProduct.toMap();
    final docId = rxProduct.id;

    await FirebaseFirestore.instance.collection('product satuan').doc(docId).set(product);
    final index = userList.indexWhere((element) => element.id == docId);
    userList[index] = rxProduct;
  }
}

import 'package:dhea_fb/home/dashboard/add_paket/ctrl_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? pickedImage;
final namaPhoto = pickedImage?.name;
bool uploading = false;
bool isButtonActive = true;
XFile? pickImageUpload;

final typePhoto = pickedImage?.mimeType;
List<ModelPaket> userList = [];
var isEnd = false;
var limit = 3;

var imageUrl = '';

// final valJudul = cd.judul.text;
// final valHarga = int.parse(cd.harga.text);
// final valDesk = cd.deskripsi.text;
// final id = UniqueKey().toString();
// final createdAt = DateTime.now();
// final valImage = imageUrl;

// final valProduct = ModelPaket(
//     deskripsi: valDesk, harga: valHarga, id: id, judul: valJudul, createdAt: createdAt.toString(), image: valImage);

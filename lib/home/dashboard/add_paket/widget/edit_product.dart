import 'package:dhea_fb/home/dashboard/add_paket/ctrl_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/data_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/model.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/list_product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final id = UniqueKey().toString();

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () async {
                pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                debugPrint(pickedImage?.name);
                debugPrint(pickedImage?.mimeType);
                setState(() {});
              },
              child: Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.grey),
                child: pickedImage == null
                    ? const Icon(
                        Icons.camera,
                        size: 40,
                      )
                    : Image.network(
                        '${pickedImage?.path}',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: pickedImage == null
                  ? null
                  : () {
                      bool uploading = false;
                      namaPhoto == id;

                      // ignore: dead_code
                      uploading ? null : cs.editStorage(id);
                    },
              child: const Text(
                "Upload Image",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cd.judul,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Edit Judul',
                labelText: 'Judul Paket',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cd.harga,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Harga',
                labelText: 'Masukan Harga',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cd.deskripsi,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Deskripsi',
                labelText: 'Deskripsi Paket',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final editJudul = cd.judul.text;
                final editHarga = double.parse(cd.harga.text);
                final editDesk = cd.deskripsi.text;
                final editCreatedAt = DateTime.now();
                final editImage = imageUrl;
                final id = selectedId;

                final editProduct = ModelPaket(
                    deskripsi: editDesk,
                    harga: editHarga,
                    id: id,
                    judul: editJudul,
                    createdAt: editCreatedAt.toString(),
                    image: editImage);
                cd.deskripsi.clear();
                cd.harga.clear();
                cd.judul.clear();

                Navigator.pop(context);
                Navigator.pop(context);
                cd.updateProduct(editProduct);
              },
              child: const Text(
                "Edit Product",
              ),
            ),
          ],
        ));
  }
}

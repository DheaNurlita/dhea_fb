import 'package:dhea_fb/home/dashboard/add_paket/ctrl_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/data_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/model.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PaketSatuanView extends StatefulWidget {
  const PaketSatuanView({super.key});

  @override
  State<PaketSatuanView> createState() => _PaketSatuanViewState();
}

class _PaketSatuanViewState extends State<PaketSatuanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paket Satuan'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: pickedImage == null
                      ? null
                      : () {
                          pickImageUpload = pickedImage;

                          // ignore: unrelated_type_equality_checks
                          uploading == true ? null : cs.uploadStorage();
                          setState(() {
                            isButtonActive = false;
                          });
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
                    hintText: 'Masukan Judul',
                    labelText: 'Judul Product',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: cd.harga,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Harga',
                    labelText: 'Harga Product',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: cd.deskripsi,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Deskripsi Product',
                    labelText: 'Masukan Deskripsi',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final valJudul = cd.judul.text;
                    final valHarga = double.parse(cd.harga.text);
                    final valDesk = cd.deskripsi.text;
                    final id = UniqueKey().toString();
                    final createdAt = DateTime.now();
                    final valImage = imageUrl;

                    final valProduct = ModelPaket(
                        deskripsi: valDesk,
                        harga: valHarga,
                        id: id,
                        judul: valJudul,
                        createdAt: createdAt.toString(),
                        image: valImage);
                    cd.deskripsi.clear();
                    cd.harga.clear();
                    cd.judul.clear();

                    Navigator.pop(context);

                    await cd.createPaketSatuan(valProduct);
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

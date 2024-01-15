import 'package:dhea_fb/home/dashboard/add_paket/ctrl_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/edit_product.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  final String id;

  const DetailProduct({super.key, required this.id});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail product'),
        ),
        floatingActionButton: FloatingActionButton(
            heroTag: false,
            child: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProduct(),
                  ));
            }),
        body: FutureBuilder(
            future: cd.getDoc(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!.image),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                              Colors.black54,
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${snapshot.data!.judul}\n ${snapshot.data!.harga}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Text(snapshot.data!.deskripsi.toString()),
                    ],
                  ),
                );
              }

              return const Text('');
            }));
  }
}

import 'package:dhea_fb/home/dashboard/add_paket/ctrl_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/data_paket.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/detail_product.dart';
import 'package:dhea_fb/home/dashboard/add_paket/widget/paket_satuan.dart';
import 'package:flutter/material.dart';

String selectedId = '';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  void initState() {
    cd.loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaketSatuanView()));
              }),
          const SizedBox(height: 20),
          FloatingActionButton(
              heroTag: null,
              child: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {});
              }),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: cd.listProduct(),
          builder: (context, snapshot) {
            final length = userList.length;
            if (snapshot.hasData) {
              return Column(
                children: [
                  Wrap(
                    children: [
                      ...List.generate(
                        length,
                        (index) {
                          final data = userList[index];
                          final id = data.id;

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailProduct(id: id)),
                              );
                              setState(() {
                                selectedId = id;
                                debugPrint(selectedId);
                              });
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              // color: Colors.amber,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                image: DecorationImage(
                                  image: NetworkImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.all(5),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 10, left: 5),
                                    width: 100,
                                    height: 20,
                                    decoration: BoxDecoration(color: Colors.pink.shade200, boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(
                                          2.0,
                                          2.0,
                                        ),
                                        blurRadius: 8.0,
                                      ),
                                    ]),
                                    child: Center(
                                      child: Text(
                                        data.judul,
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () async {
                                        await cd.delete(id);
                                        // await cs.deleteImage();
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.pink.shade900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  isEnd
                      ? const Text('Data habis bro')
                      : snapshot.connectionState == ConnectionState.waiting
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  cd.loading();
                                });
                              },
                              child: const Text(
                                "Loadmore...",
                              ),
                            ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/produk_detail.dart';
import 'package:flutter_app/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
        actions: [
          GestureDetector(
            // menampilkan icon add
            child: const Icon(Icons.add),
            // pada saat icon di tekan
            onTap: () async {
              // berpindah ke halaman ProdukForm
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProdukForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          // list 1
          ItemProduk(kodeProduk: 'A001', namaProduk: 'kulkas', harga: 2500000),
          // list 2
          ItemProduk(kodeProduk: 'A002', namaProduk: 'tv', harga: 2500000),
          // list 3
          ItemProduk(
              kodeProduk: 'A003', namaProduk: 'mesin cuci', harga: 2500000),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ItemProduk({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(namaProduk.toString()),
          subtitle: Text(harga.toString()),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      kodeProduk: kodeProduk,
                      namaProduk: namaProduk,
                      harga: harga,
                    )));
      },
    );
  }
}

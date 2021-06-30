import 'package:flutter/material.dart';
import 'package:hashlob_assignment/model/product.dart';
import 'package:hashlob_assignment/service/service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Datum> _product;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Service.getProducts().then((prodcuts) {
      setState(() {
        _product = prodcuts;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _loading ? 'Loading...' : 'Hashlob-Products',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, index) {
            Datum product = _product[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Price: ${product.price}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: null == _product ? 0 : _product.length,
        ),
      ),
    );
  }
}

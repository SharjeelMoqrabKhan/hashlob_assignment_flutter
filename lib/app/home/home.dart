import 'package:flutter/material.dart';
import 'package:hashlob_assignment/model/product.dart';
import 'package:hashlob_assignment/service/service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Datum> _product;
  List<Datum> _filterProducts = List();
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Service.getProducts().then((prodcuts) {
      setState(() {
        _product = prodcuts;
        _filterProducts = _product;
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
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "Search",
            ),
            onChanged: (value) {
              setState(() {
                _filterProducts = _product.where((element) {
                  return element.name
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      element.price.contains(value);
                }).toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                Datum product = _filterProducts[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
              itemCount: null == _filterProducts ? 0 : _filterProducts.length,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hashlob_assignment/model/product.dart';
import 'package:hashlob_assignment/service/service.dart';

class Home extends StatefulWidget {
  final ValueSetter<Datum> _valueSetter;
  Home(this._valueSetter);
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
      body: Builder(builder: (context) {
        return Column(
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
                  return ListTile(
                    title: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Add to cart"),
                    trailing: Text(
                      'Price: ${product.price}',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      widget._valueSetter(_filterProducts[index]);
                      SnackBar cartSnakBar = SnackBar(
                        content: Text("added ${product.name}"),
                      );
                      Scaffold.of(context).showSnackBar(cartSnakBar);
                    },
                  );
                },
                itemCount: null == _filterProducts ? 0 : _filterProducts.length,
              ),
            ),
          ],
        );
      }),
    );
  }
}

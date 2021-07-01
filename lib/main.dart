import 'package:flutter/material.dart';
import 'package:hashlob_assignment/model/product.dart';
import 'app/screens/checkout.dart';
import 'app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: 'Hashlob API',
      home: Hashlob(),
    );
  }
}

class Hashlob extends StatefulWidget {
  @override
  _HashlobState createState() => _HashlobState();
}

class _HashlobState extends State<Hashlob> {
  List<Datum> cart = List();
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hashlob Flutter Assignment'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [Tab(text: "Products"), Tab(text: "Checkout")],
          ),
        ),
        body: TabBarView(children: [
          Home((selectedPro) {
            setState(() {
              cart.add(selectedPro);
            });
          }),
          Checkout(cart)
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final cart;
  final sum;
  Checkout(this.cart, this.sum);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart List',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    cart[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Price: ${cart[index].price}',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              itemCount: null == cart ? 0 : cart.length,
            ),
          ),
          Divider(
            height: 40,
          ),
          Text(
            "Total Price: $sum",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

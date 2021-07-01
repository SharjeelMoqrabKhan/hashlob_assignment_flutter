import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final cart;
  final sum;
  Checkout(this.cart, this.sum);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
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
            itemCount: cart.length,
            shrinkWrap: true,
          ),
          Divider(
            height: 40,
          ),
          Text("Total Price: $sum"),
        ],
      ),
    );
  }
}

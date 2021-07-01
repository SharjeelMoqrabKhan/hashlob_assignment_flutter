import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final cart;
  Checkout(this.cart);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  cart[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  cart[index].price,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}

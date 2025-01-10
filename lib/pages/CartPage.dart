import 'package:flutter/material.dart';
import 'package:flutter_project/components/coffee_tile.dart';
import 'package:flutter_project/models/drink.dart';
import 'package:flutter_project/models/drink_shop.dart';
import 'package:flutter_project/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove items
  void removeFromCart(Coffee coffee) {
    Provider.of<DrinkShop>(context, listen: false).removeItemFromCart(coffee);
  }

  //pay button tapped
  void payNow() {
    /*

    fill payment service

    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              // List of Cart
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get individual coffee
                      Coffee eachcoffee = value.userCart[index];
                      //return cofee tile
                      return CoffeeTile(
                        coffee: eachcoffee,
                        onPressed: () => removeFromCart(eachcoffee),
                        icon: Icon(Icons.delete),
                      );
                    }),
              ),
              //pay button
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      "Payment page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

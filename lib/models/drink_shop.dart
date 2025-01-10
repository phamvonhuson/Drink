import 'package:flutter/material.dart';
import 'drink.dart';

class DrinkShop extends ChangeNotifier {
  // Coffee for sales list
  final List<Coffee> _shop = [
    // americano
    Coffee(
        name: 'americano', imagePath: "lib/images/americano.png", price: "4.10"),

    // frappe
    Coffee(name: 'frappe', imagePath: "lib/images/frappe.png", price: "5.10"),

    // espresso
    Coffee(
        name: 'espresso', imagePath: "lib/images/espresso.png", price: "4.20"),

    // cappuccino
    Coffee(
        name: 'cappuccino',
        imagePath: "lib/images/cappuccino.png",
        price: "4.45"),
            // mocha
    Coffee(
        name: 'mocha',
        imagePath: "lib/images/mocha.png",
        price: "4.45"),

  ];

  // User cart
  final List<Coffee> _userCart = [];

  // Get the coffee list
  List<Coffee> get coffeeShop => _shop;

  // Get user cart
  List<Coffee> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners(); // Notify listeners when cart changes
  }

  // Remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners(); // Notify listeners when cart changes
  }

  // Display the cart receipt
  String displayCartReceipt() {
    if (_userCart.isEmpty) {
      return "Your cart is empty.";
    }

    double total = 0;
    String receipt = "Order Details:\n";

    // Add each item to the receipt
    for (var coffee in _userCart) {
      receipt += "${coffee.name} - \$${coffee.price}\n";
      total += double.parse(coffee.price); // Sum the total price
    }

    // Add total price to the receipt
    receipt += "Total: \$${total.toStringAsFixed(2)}";
    return receipt;
  }
}

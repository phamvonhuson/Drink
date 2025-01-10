import 'package:flutter/material.dart';
import 'package:flutter_project/models/drink.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  final void Function()? onPressed; // Marked as final
  final Widget icon;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  State<CoffeeTile> createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(widget.coffee.name),
        subtitle: Text(widget.coffee.price.toString()),
        leading: Image.asset(widget.coffee.imagePath),
        trailing: IconButton(
          icon: widget.icon,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}

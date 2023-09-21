import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.foodImg, required this.foodName});

  final String foodImg;
  final String foodName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(foodImg, fit: BoxFit.cover)),
          Text(
            foodName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("[담기]"),
        ],
      ),
    );
  }
}

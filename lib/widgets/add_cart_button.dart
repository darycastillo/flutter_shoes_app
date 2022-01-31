// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:flutter_shoes_app/widgets/widgets.dart';

class AddToCartButton extends StatelessWidget {
  final double amount;
  const AddToCartButton({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Text(
                '\$${this.amount}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const OrangeButton(text: 'Add to cart')
            ],
          ),
        ),
      ),
    );
  }
}

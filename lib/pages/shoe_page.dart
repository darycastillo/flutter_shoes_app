import 'package:flutter/material.dart';

import 'package:flutter_shoes_app/widgets/widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(text: 'For you'),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(tag: 'shoe_1', child: ShoeSizePrevew()),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          const AddToCartButton(amount: 180.00)
        ],
      ),
    );
  }
}

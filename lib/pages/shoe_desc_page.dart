// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_shoes_app/helpers/helpers.dart';
import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:flutter_shoes_app/widgets/widgets.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoe_1',
                child: ShoeSizePrevew(fullScreen: true),
              ),
              Positioned(
                top: 90,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    setStatusBarDark();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.white, size: 60),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _AmountBuyNow(),
                  _ColorsAndMore(),
                  _ButtonsLikeCartSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonsLikeCartSettings extends StatelessWidget {
  const _ButtonsLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowButton(icon: Icon(Icons.star, color: Colors.red)),
          _ShadowButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          _ShadowButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final Icon icon;
  const _ShadowButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              spreadRadius: -5,
              offset: Offset(0, 5),
            )
          ]),
      child: this.icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 90,
                  child: _ColorButton(
                    Color(0xff364D56),
                    1,
                    'assets/imgs/negro.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _ColorButton(
                    Color(0xff2099F1),
                    2,
                    'assets/imgs/azul.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _ColorButton(
                    Color(0xffFFAD29),
                    3,
                    'assets/imgs/amarillo.png',
                  ),
                ),
                _ColorButton(
                  Color(0xffC6D642),
                  4,
                  'assets/imgs/verde.png',
                ),
              ],
            ),
          ),
          const OrangeButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;
  const _ColorButton(this.color, this.index, this.assetImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 200),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => Provider.of<ShoeModel>(context, listen: false).assetImage =
            this.assetImage,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  const _AmountBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          const Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          SlideInRight(
            delay: const Duration(microseconds: 500),
            child: const OrangeButton(
              text: 'Buy now',
              height: 40,
              width: 120,
            ),
          )
        ],
      ),
    );
  }
}

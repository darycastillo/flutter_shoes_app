// ignore_for_file: unnecessary_this
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:flutter_shoes_app/pages/shoe_desc_page.dart';

class ShoeSizePrevew extends StatelessWidget {
  final bool fullScreen;
  const ShoeSizePrevew({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!this.fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ShoeDescPage()),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: this.fullScreen ? 5 : 30,
          vertical: this.fullScreen ? 6 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: this.fullScreen ? 420 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: this.fullScreen
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              if (!this.fullScreen) const _ShoeSize(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  const _ShoeSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShoeSizeBox(7.0),
          _ShoeSizeBox(7.5),
          _ShoeSizeBox(12.4),
          _ShoeSizeBox(11),
          _ShoeSizeBox(9),
          _ShoeSizeBox(12),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double number;

  const _ShoeSizeBox(this.number);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () => shoeModel.talla = number,
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: this.number == shoeModel.talla
              ? const Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (this.number == shoeModel.talla)
              const BoxShadow(
                color: Color(0xffF1A23A),
                offset: Offset(0, 5),
                blurRadius: 10,
              )
          ],
        ),
        child: Text(
          this.number.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: this.number == shoeModel.talla
                ? Colors.white
                : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _ShoeShadow(),
          ),
          Image(
            image: AssetImage(shoeModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 260,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          // color: Colors.transparent,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
              // blurStyle: BlurStyle.outer,
            )
          ],
        ),
      ),
    );
  }
}

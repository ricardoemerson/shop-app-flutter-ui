import 'package:flutter/material.dart';

import '../../../shared/themes/themes.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(numOfItems.toString().padLeft(2, '0'),
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOutlinedButton(
            icon: Icons.add, press: () => setState(() => {numOfItems++})),
      ],
    );
  }

  Widget buildOutlinedButton({IconData? icon, void Function()? press}) {
    return Container(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Icon(
          icon,
          color: kTextColor,
        ),
      ),
    );
  }
}

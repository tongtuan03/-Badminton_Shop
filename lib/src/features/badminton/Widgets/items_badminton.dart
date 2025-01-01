import 'package:batminton_shop/src/constants/badminton_strings.dart';
import 'package:batminton_shop/src/constants/colors.dart';
import 'package:batminton_shop/src/features/badminton/models/badminton_model.dart';
import 'package:flutter/material.dart';

class Item_Badminton extends StatelessWidget{
  final Badminton racket;

  Item_Badminton(this.racket);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,

      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 3), // Khung viền
            borderRadius: BorderRadius.circular(10), // Bo góc
          ),
          child: Padding(
            padding: const EdgeInsets.all(4), // Khoảng cách giữa hình và viền
            child: Image.network(
              racket.linkImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

}

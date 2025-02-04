import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.0,
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(
          color: Colors.orange,
          width: 3.0,
        ),
        color: Colors.yellow,
      ),
      margin: const EdgeInsets.only(bottom: 40.0),
      child: const Icon(
        Icons.star,
        size: 40.0,
        color: Colors.orange,
      ),
    );
  }
}

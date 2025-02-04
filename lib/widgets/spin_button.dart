import 'package:flutter/material.dart';

class SpinButton extends StatelessWidget {
  const SpinButton({super.key, required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 45.0,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
              side: const BorderSide(
                color: Colors.purple,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'Spin',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}

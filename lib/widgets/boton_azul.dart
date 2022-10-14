import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final String buttonText;
  final VoidCallback  onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const StadiumBorder(),
    backgroundColor: Colors.blue
  );

  BotonAzul({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text( buttonText, style: const TextStyle( color: Colors.white, fontSize: 17 ),)
            ),
        )
      );
  }
}
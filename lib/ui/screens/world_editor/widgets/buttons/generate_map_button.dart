import 'package:flutter/material.dart';

class GenerateMapButton extends StatelessWidget {
  final void Function() onPressed;

  const GenerateMapButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(33, 33, 222, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        'GENERAR MAPA',
        style: TextStyle(fontFamily: 'PressStart2P', color: Colors.white),
      ),
    );
  }
}

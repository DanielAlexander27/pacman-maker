import 'package:flutter/material.dart';
import 'package:packman_maker/domain/utils/system_converter.dart';

enum GameElement {
  pacMan(
    name: 'Pac-Man',
    color: Color.fromRGBO(255, 255, 0, 1),
    image: 'assets/images/pac-man.png',
  ),
  blinky(
    name: 'Blinky',
    color: Color.fromRGBO(255, 0, 0, 1),
    image: 'assets/images/blinky.png',
  ),
  pinky(
    name: 'Pinky',
    color: Color.fromRGBO(255, 184, 222, 1),
    image: 'assets/images/pinky.png',
  ),
  inky(
    name: 'Inky',
    color: Color.fromRGBO(0, 255, 222, 1),
    image: 'assets/images/inky.png',
  ),
  clyde(
    name: 'Clyde',
    color: Color.fromRGBO(255, 184, 71, 1),
    image: 'assets/images/clyde.png',
  ),
  powerPellet(
    name: 'Esteroide',
    color: Colors.orange,
    image: 'assets/images/power-pellet.png',
  ),
  pellet(
    name: 'Bolita',
    color: Colors.white,
    image: 'assets/images/pellet.png',
  ),
  wall(
    name: 'Pared',
    color: Color.fromRGBO(33, 33, 222, 1),
    image: 'assets/images/wall.png',
  );

  const GameElement({
    required this.name,
    required this.color,
    required this.image,
  });

  final Color color;
  final String name;
  final String image;

  String get assemblyColor {
    final redBinary = SystemConverter.decToBinary((color.r * 255).toInt(), 5);
    final greenBinary = SystemConverter.decToBinary((color.g * 255).toInt(), 5);
    final blueBinary = SystemConverter.decToBinary((color.b * 255).toInt(), 5);

    return SystemConverter.binaryToHex('$redBinary$greenBinary$blueBinary');
  }

  String get assemblyColorInstruction =>
      '$assemblyColorName, HEX $assemblyColor';

  String get assemblyColorName => '${name.toUpperCase()}_COLOR';
}

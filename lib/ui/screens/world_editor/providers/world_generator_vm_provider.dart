import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/enums/game_element.dart';

export '../../../../domain/enums/game_element.dart';

part 'world_generator_vm_provider.g.dart';

@riverpod
class WorldGeneratorViewModel extends _$WorldGeneratorViewModel {
  int? _pacmanIndex;
  int? _blinkyIndex;
  int? _pinkyIndex;
  int? _inkyIndex;
  int? _clydeIndex;

  final sizeRow = 16;
  late final sizeGrid = sizeRow * sizeRow;

  @override
  List<GameElement?> build() {
    return List.generate(sizeGrid, (_) => null, growable: false);
  }

  void setGameElementByIndex(int index, GameElement element) {
    int? removeIndex;

    switch (element) {
      case GameElement.pacMan:
        removeIndex = _pacmanIndex;
        _pacmanIndex = index;
        break;
      case GameElement.blinky:
        removeIndex = _blinkyIndex;
        _blinkyIndex = index;
        break;
      case GameElement.pinky:
        removeIndex = _pinkyIndex;
        _pinkyIndex = index;
        break;
      case GameElement.inky:
        removeIndex = _inkyIndex;
        _inkyIndex = index;
        break;
      case GameElement.clyde:
        removeIndex = _clydeIndex;
        _clydeIndex = index;
        break;
      default:
        break;
    }

    if (removeIndex != null) state[removeIndex] = null;
    state[index] = element;
    state = [...state];
  }

  void setGameElementByPosition(int row, int column, GameElement element) {
    final index = row * sizeRow + column;
    setGameElementByIndex(index, element);
  }

  String generateAssemblyCode() {
    StringBuffer sb = StringBuffer();

    sb.write('LOAD OFFSET\n');
    final elementsSet = <GameElement>{};

    for (int i = 0; i < state.length; i++) {
      final element = state[i];

      if (element != null) {
        elementsSet.add(element);
        sb.write('STORE MAP_POSITION\n');
        sb.write('LOAD ${element.assemblyColorName}\n');
        sb.write('STOREI MAP_POSITION\n');
        sb.write('LOAD MAP_POSITION\n');
      }

      sb.write('ADD ONE\n');
    }

    sb.write('HALT\n\n');
    sb.write('OFFSET, HEX F00\n');
    sb.write('MAP_POSITION, HEX F00\n');
    sb.write('ONE, DEC 1\n');

    for (final element in elementsSet) {
      final isActor =
          element != GameElement.wall &&
          element != GameElement.powerPellet &&
          element != GameElement.pellet;

      if (isActor) {
        final index = state.indexOf(element);

        final row = index ~/ sizeRow;
        final column = index % sizeRow;
        sb.write('${element.name.toLowerCase()}Row, DEC $row\n');
        sb.write('${element.name.toLowerCase()}Column, DEC $column\n');
      }

      sb.write(element.assemblyColorInstruction);
      sb.write('\n\n');
    }

    return sb.toString();
  }
}

@riverpod
GameElement? cellElement(Ref ref, int index) {
  final List<GameElement?> world = ref.watch(worldGeneratorViewModelProvider);
  return world[index];
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packman_maker/ui/screens/world_editor/providers/world_generator_vm_provider.dart';

import '../providers/game_element_selected_provider.dart';

class MapGrid extends ConsumerWidget {
  final double mapSize;

  const MapGrid({super.key, required this.mapSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(worldGeneratorViewModelProvider.notifier);
    final cellSize = mapSize / viewModel.sizeRow;

    return SizedBox(
      width: mapSize,
      height: mapSize,
      child: Listener(
        onPointerDown:
            (event) => _handleTouch(event.localPosition, cellSize, ref),
        onPointerMove:
            (event) => _handleTouch(event.localPosition, cellSize, ref),
        child: GridView.count(
          crossAxisCount: viewModel.sizeRow,
          children: List.generate(
            viewModel.sizeGrid,
            (index) => _CellElement(index: index),
          ),
        ),
      ),
    );
  }

  void _handleTouch(Offset localPosition, double cellSize, WidgetRef ref) {
    final int row = (localPosition.dy ~/ cellSize);
    final int column = (localPosition.dx ~/ cellSize);

    final elementSelected = ref.read(gameElementSelectedProvider);

    ref
        .read(worldGeneratorViewModelProvider.notifier)
        .setGameElementByPosition(row, column, elementSelected);
  }
}

class _CellElement extends ConsumerWidget {
  final int index;

  const _CellElement({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final element = ref.watch(cellElementProvider(index));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: element?.color,
          border: Border(
            top: _borderSide,
            left: _borderSide,
            bottom: bottomBorder,
            right: rightBorder,
          ),
        ),
      ),
    );
  }

  BorderSide get bottomBorder =>
      (index < (16 * 16) && index >= (16 * 15)) ? _borderSide : BorderSide.none;

  BorderSide get rightBorder =>
      (index % 16 == 15) ? _borderSide : BorderSide.none;
}

const _borderSide = BorderSide(color: Colors.grey, width: 1);

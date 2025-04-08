import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packman_maker/ui/screens/world_editor/providers/game_element_selected_provider.dart';

import '../../../../domain/enums/game_element.dart';

class GameElementSelectorItem extends ConsumerWidget {
  final GameElement gameElement;

  const GameElementSelectorItem(this.gameElement, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementSelected = ref.watch(gameElementSelectedProvider);
    final bool isSelected = elementSelected == gameElement;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ref
              .read(gameElementSelectedProvider.notifier)
              .setElement(gameElement);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: isSelected ? 0 : 1.0,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isSelected
                        ? _borderColor
                        : _borderColor.withValues(alpha: 0.8),
                width: isSelected ? 2 : 1.0,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(gameElement.image, height: 30, width: 30),
                SizedBox(width: 8),
                Text(
                  gameElement.name.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isSelected ? FontWeight.w600 : null,
                    fontFamily: 'PressStart2P',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const _borderColor = Color.fromRGBO(33, 33, 222, 1);

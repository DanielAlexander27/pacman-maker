import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packman_maker/ui/screens/world_editor/widgets/game_element_selector_item.dart'
    show GameElementSelectorItem;

import '../../../../domain/enums/game_element.dart';

class GameElementSelector extends ConsumerWidget {
  const GameElementSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children:
          GameElement.values
              .map(
                (gameElement) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GameElementSelectorItem(gameElement),
                ),
              )
              .toList(),
    );
  }
}

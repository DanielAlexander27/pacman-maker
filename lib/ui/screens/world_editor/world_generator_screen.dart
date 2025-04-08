import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:packman_maker/ui/screens/world_editor/providers/world_generator_vm_provider.dart';
import 'package:packman_maker/ui/screens/world_editor/widgets/buttons/generate_map_button.dart';

import 'widgets/game_element_selector.dart';
import 'widgets/map_grid.dart';

class WorldEditorScreen extends ConsumerWidget {
  const WorldEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Title(),
            SizedBox(height: 5),
            GameElementSelector(),
            SizedBox(height: 10),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return MapGrid(mapSize: constraints.maxHeight);
                },
              ),
            ),
            SizedBox(height: 10),
            GenerateMapButton(
              onPressed: () {
                final assemblyCode =
                    ref
                        .read(worldGeneratorViewModelProvider.notifier)
                        .generateAssemblyCode();

                Clipboard.setData(ClipboardData(text: assemblyCode));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Pac-Man Maker'.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'PressStart2P',
      ),
    );
  }
}

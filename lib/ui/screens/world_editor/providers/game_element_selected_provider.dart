import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/enums/game_element.dart';

part 'game_element_selected_provider.g.dart';

@riverpod
class GameElementSelected extends _$GameElementSelected {
  @override
  GameElement build() => GameElement.pacMan;

  void setElement(GameElement gameElement) => state = gameElement;
}

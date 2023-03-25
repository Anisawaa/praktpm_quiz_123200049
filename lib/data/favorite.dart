import 'package:praktpm_quiz_123200049/data/game_store.dart';

class Favorite {
  final GameStore? gamestore;
  final bool? isFavorite;

  Favorite({this.gamestore, this.isFavorite});

  var favoriteList = <Favorite>[];
}

import 'package:flutter/material.dart';
import 'package:praktpm_quiz_123200049/data/game_store.dart';
import 'package:praktpm_quiz_123200049/pages/store_detail.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  var gameFavorite = <GameStore>[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Game Store'),
          ),
          body: ListView.builder(
              itemCount: gameList.length,
              itemBuilder: (context, index) {
                final GameStore gamestore = gameList[index];
                return ListTile(
                  leading: Image.network(
                    gamestore.imageUrls[0],
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text('${gamestore.name}'),
                  subtitle: Text('${gamestore.releaseDate}'),
                  trailing: Text('Rp ${gamestore.price}'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StoreDetail(
                            gamestore: gamestore, favorite: gameFavorite)));
                  },
                );
              }),
        ),
    );
  }
}

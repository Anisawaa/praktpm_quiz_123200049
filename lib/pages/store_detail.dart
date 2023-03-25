import 'package:flutter/material.dart';
import 'package:praktpm_quiz_123200049/data/game_store.dart';

class StoreDetail extends StatefulWidget {
  final GameStore gamestore;
  final List<GameStore> favorite;
  const StoreDetail({Key? key, required this.gamestore, required this.favorite})
      : super(key: key);

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  bool isFavorite = false;

  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.gamestore);
      } else {
        widget.favorite.remove(widget.gamestore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = widget.favorite.contains(widget.gamestore);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.gamestore.name}'),
          actions: [
            IconButton(
                onPressed: () {
                  print(widget.gamestore.linkStore);
                  launch(widget.gamestore.linkStore);
                },
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.gamestore.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              widget.gamestore.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setFavorite();
                                },
                                icon: Icon(Icons.favorite,
                                    color: isFavorite ? Colors.red : Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.price_change),
                              Text(
                                'Rp ${widget.gamestore.price}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.reviews),
                              Text(
                                '${widget.gamestore.reviewAverage}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.tag),
                              Text(
                                '${widget.gamestore.reviewCount}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Tags : ${widget.gamestore.tags}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Release Date : ${widget.gamestore.releaseDate}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'About : ${widget.gamestore.about}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void launch(String productUrl) {}
}

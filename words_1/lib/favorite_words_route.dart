import 'package:flutter/material.dart';

class FavoriteWordsRoute extends StatelessWidget {
  final List<String> favoriteItems;
  const FavoriteWordsRoute({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Favorite words'),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(favoriteItems[index]),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: favoriteItems.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/albums.dart';

void main() {
  runApp(const SpotifyUIClone());
}

class SpotifyUIClone extends StatelessWidget {
  const SpotifyUIClone({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify UI Clone',
      theme: ThemeData.dark(),
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromARGB(255, 75, 80, 70), Colors.black],
            center: Alignment(-1, -1),
            radius: 1,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader('Good night'),
                  const SizedBox(height: 10),
                  buildLastListened(),
                  const SizedBox(height: 20),
                  buildRecentlyListenedText('Recently Listened'),
                  const SizedBox(height: 15),
                  buildRecentlyListened(),
                  const SizedBox(height: 20),
                  buildRecentlyListenedText('Podcasts'),
                  const SizedBox(height: 15.0),
                  buildPodcasts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          // ignore: avoid_print
          onPressed: () => print('Go to settings!'),
          icon: const Icon(
            Icons.settings_outlined,
            size: 26,
          ),
        )
      ],
    );
  }

  Widget buildLastListened() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              buildLastListenedItem(albums[3].name, albums[3].thumbnail),
              buildLastListenedItem(albums[1].name, albums[1].thumbnail),
              buildLastListenedItem(albums[0].name, albums[0].thumbnail),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              buildLastListenedItem(albums[2].name, albums[2].thumbnail),
              buildLastListenedItem(albums[4].name, albums[4].thumbnail),
              buildLastListenedItem(albums[5].name, albums[5].thumbnail),
            ],
          ),
        )
      ],
    );
  }

  Widget buildLastListenedItem(String name, String thumbnail) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        // ignore: avoid_print
        onTap: () => print('Tap on $name'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                child: Image.network(
                  thumbnail,
                  width: 60,
                  height: 60,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecentlyListenedText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildRecentlyListened() {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: albums.map((album) => buildAlbum(album)).toList(),
      ),
    );
  }

  Widget buildAlbum(Album album) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              album.thumbnail,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              album.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPodcasts() {
    return SizedBox(
      height: 200.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: podcasts.map((podcast) => buildAlbum(podcast)).toList(),
      ),
    );
  }
}

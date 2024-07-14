import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    inrplayer();
    super.initState();
  }

  void inrplayer() async {
    await assetsAudioPlayer.open(
        Playlist(
          audios: [
            Audio(
              "assets/1.mp3",
              metas: Metas(title: "SONG 1"),
            ),
            Audio(
              "assets/2.mp3",
              metas: Metas(title: "SONG 2"),
            ),
            Audio(
              "assets/3.mp3",
              metas: Metas(title: "SONG 3"),
            ),
            Audio(
              "assets/4.mp3",
              metas: Metas(title: "SONG 4"),
            ),
          ],
        ),
        autoStart: false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      assetsAudioPlayer.getCurrentAudioTitle == ""
                          ? "plasse play your song"
                          : assetsAudioPlayer.getCurrentAudioTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    getbitwidget,
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "00:  /  2:30",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get getbitwidget =>
      assetsAudioPlayer.builderIsPlaying(builder: (ctx, isplaying) {
        return FloatingActionButton(
          child: Icon(
            isplaying ? Icons.pause : Icons.play_arrow,
            size: 50,
          ),
          onPressed: () {
            if (isplaying) {
              assetsAudioPlayer.pause();
            } else {
              assetsAudioPlayer.play();
            }
            setState(() {});
          },
          shape: CircleBorder(),
        );
      });
}

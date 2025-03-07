import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PageItems extends StatefulWidget {
  final String azkar;

  const PageItems({super.key, required this.azkar});
  @override
  State<PageItems> createState() => _PageItemsState();
}

class _PageItemsState extends State<PageItems> {
  late FlutterTts flutterTts;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    setupTts();
  }

  Future<void> setupTts() async {
    if (await flutterTts.isLanguageAvailable("ar")) {
      await flutterTts.setLanguage("ar");
    }
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> speak() async {
    await flutterTts.speak(widget.azkar);
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/quran.png",
            width: 120,
            height: 120,
          ),
          Text(
            widget.azkar,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '$counter',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  icon: Icon(Icons.refresh_outlined)),
              IconButton(onPressed: speak, icon: Icon(Icons.hearing)),
            ],
          ),
        ],
      ),
    );
  }
}

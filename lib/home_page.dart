import 'package:azkar/page_items.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  final List<PageItems> azkarList = [
    PageItems(azkar: "سُبْحَانَ اللَّهِ"),
    PageItems(azkar: "الْحَمْدُ لِلَّهِ "),
    PageItems(azkar: 'اللَّهُ أَكْبَرُ'),
    PageItems(
        azkar:
            "لَا إِلهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 180, 122, 237),
              Color.fromARGB(255, 155, 186, 250),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: azkarList,
              ),
            ),
            SizedBox(height: 20),
            SmoothPageIndicator(
              controller: controller,
              count: azkarList.length,
              effect: WormEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.white,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

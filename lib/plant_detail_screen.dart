import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plants/constant.dart';

class PlantDetailScreen extends StatefulWidget {
  const PlantDetailScreen({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  int selectedIndex = 2;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(190, 12, 65, 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: ListView.separated(
                          padding: const EdgeInsets.only(
                              top: 30, right: 10, bottom: 10, left: 10),
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 800),
                                  child: selectedIndex == index
                                      ? CustomPaint(
                                          painter: EdgeCuts(),
                                          child: Image.asset(
                                            'images/${plants[index]}.png',
                                            height: 100,
                                          ),
                                        )
                                      : Image.asset(
                                          'images/${plants[index]}.png',
                                          height: 100,
                                        ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                          itemCount: plants.length),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(190, 12, 65, 0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.asset(
                                  'images/${plants[selectedIndex]}.png')),
                          //const SizedBox(height: 20,),
                          const Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "FLOWER",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 226, 208, 5),
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '50\$',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 226, 208, 5),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'here is you can find the discription of the flower or plant,its family ,the lighting it\'s need and etc...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 226, 208, 5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EdgeCuts extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var path = Path()
      ..moveTo(w * 1.15, h * -0.01)
      ..quadraticBezierTo(w * 1.15, h * -0.1, w * 1, h * -0.1)
      ..lineTo(w * 0.08, h * -0.1)
      ..quadraticBezierTo(w * -0.01, h * -0.05, w * 0.0, 0.05)
      ..lineTo(w * 0.0, h * 0.95)
      ..quadraticBezierTo(w * 0.01, h * 1.1, w * 0.08, h * 1.10)
      ..lineTo(w * 1, h * 1.15)
      ..quadraticBezierTo(w * 1, h * 1.15, w * 1.15, h * 1.15);
    canvas.drawPath(
        path,
        Paint()
          ..color = const Color.fromARGB(189, 9, 48, 0)
          ..strokeWidth = 3
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

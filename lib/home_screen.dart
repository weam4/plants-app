import 'package:flutter/material.dart';
import 'package:plants/constant.dart';
import 'package:plants/plant_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tabTitles = [
    {'number': 12, 'title': 'All'},
    {'number': 8, 'title': 'Outdoor'},
    {'number': 4, 'title': 'Indoor'},
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(190, 12, 65, 0),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  )),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "florest",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.shopping_bag_outlined,
                                color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'images/feverfew.png',
                            width: 270,
                            height: 280,
                          ),
                        ),
                        Container(
                          width: 150,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 32),
                          child: const Text(
                            'Fever few',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 226, 208, 5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var tab = tabTitles[index];
                          return Transform(
                            transform: Matrix4.translationValues(0, -10, 0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey,
                                    child: Text(
                                      tab['number'].toString(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    tab['title'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: selectedIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 50,
                            ),
                        itemCount: tabTitles.length),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.only(top: 8, bottom: 15),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailScreen(
                                    selectedIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(190, 12, 65, 0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                  
                                  width: 100,
                                  child: Image.asset(
                                    'images/${plants[index]}.png',
                                    height: 150,
                                    
                                  ),
                                  
                                ),
                                   SizedBox(width: 30,), 
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'flower name',
                                              
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 226, 208, 5),
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        width: 1.5,
                                                        color: Colors.white54),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    'images/water.png',
                                                    width: 16,
                                                    height: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        width: 1.5,
                                                        color: Colors.white54),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    'images/sun.png',
                                                    width: 16,
                                                    height: 16,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        width: 1.5,
                                                        color: Colors.white54),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Image.asset(
                                                    'images/temperature.png',
                                                    width: 16,
                                                    height: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: const Icon(
                                          Icons.add,
                                          size: 32,
                                        ),
                                      ),
                                      //Image(image: ),
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: plants.length),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

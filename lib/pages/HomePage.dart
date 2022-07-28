
import 'package:flutter/material.dart';
import '../models/SystemItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Size size;
  List<SystemItem> list = [
      SystemItem(id: 'sun', image: 'sun.png', name: 'Sole'),
      SystemItem(id: 'mercury', image: 'mercury.png', name: 'Mercurio'),
      SystemItem(id: 'venus', image: 'venus.png', name: 'Venere'),
      SystemItem(id: 'earth', image: 'earth.png', name: 'Terra'),
      SystemItem(id: 'mars', image: 'mars.png', name: 'Marte'),
      SystemItem(id: 'jupiter', image: 'jupiter.png', name: 'Giove'),
      SystemItem(id: 'saturn', image: 'saturn.png', name: 'Saturno'),
      SystemItem(id: 'uranus', image: 'uranus.png', name: 'Urano'),
      SystemItem(id: 'neptune', image: 'neptune.png', name: 'Nettuno'),
      SystemItem(id: 'pluto', image: 'pluto.png', name: 'Plutone'),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.width * 0.625,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.jpg'),
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.noRepeat
                    )
                ),
              ),
              centerTitle: false,
              title: const Text('Il Sistema Solare'),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              childCount: list.length, (context, index) {
            return InkWell(
              onTap: () {},
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 16.0
                            ),
                            child: Image.asset(
                              'assets/${list[index].image}',
                              height: 60.0
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              list[index].name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                        height: 0.8,
                        color: Colors.grey[600]
                    ),
                  )
                ],
              ),
            );
          })
          ),
        ],
      ),
    );
  }
}

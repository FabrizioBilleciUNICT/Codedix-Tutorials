
import 'package:flutter/material.dart';
import '../models/SystemItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Size size;

  final List<SystemItem> list = [
    SystemItem(id: 'sun', image: 'sun.png', title: 'Sole'),
    SystemItem(id: 'mercury', image: 'mercury.png', title: 'Mercurio'),
    SystemItem(id: 'venus', image: 'venus.png', title: 'Venere'),
    SystemItem(id: 'earth', image: 'earth.png', title: 'Terra'),
    SystemItem(id: 'mars', image: 'mars.png', title: 'Marte'),
    SystemItem(id: 'jupiter', image: 'jupiter.png', title: 'Giove'),
    SystemItem(id: 'saturn', image: 'saturn.png', title: 'Saturno'),
    SystemItem(id: 'uranus', image: 'uranus.png', title: 'Urano'),
    SystemItem(id: 'neptune', image: 'neptune.png', title: 'Nettuno'),
    SystemItem(id: 'pluto', image: 'pluto.png', title: 'Plutone'),
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
            floating: true,
            pinned: true,
            snap: true,
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
              title: const Text('Sistema Solare'),
            ),
          ),
          SliverAnimatedList(
            initialItemCount: list.length,
            itemBuilder: (context, index, animation) =>
                SizeTransition(
                    sizeFactor: animation,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/details', arguments: { 'item': list[index]}),
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                    child: Hero(
                                        tag: list[index].id,
                                        child: Image.asset('assets/${list[index].image}', height: 60.0,)
                                    )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(list[index].title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(height: 0.8, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                )
          ),
        ],
      ),
    );
  }
}

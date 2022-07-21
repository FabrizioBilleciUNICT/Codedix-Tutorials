
import 'package:codedix_tutorials/utils/data_service.dart';
import 'package:flutter/material.dart';
import '../models/SystemItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Size size;
  List<SystemItem> list = [];

  void loadData() async {
    list = await DataService().loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
              title: const Text('Il Sistema Solare'),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              childCount: list.length, (context, index) {
            return InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(
                      '/details', arguments: { 'item': list[index]}),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            child: Hero(
                                tag: list[index].id,
                                child: Image.asset(
                                  'assets/${list[index].image}',
                                  height: 60.0,)
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(list[index].name,
                              style: const TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(height: 0.8,
                        color: Colors.grey[600]),
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

import 'package:codedix_tutorials/models/SystemItem.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  late Size size;
  bool firstAccess = true;
  late SystemItem item;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!firstAccess) return;

    Map data = (ModalRoute
        .of(context)
        ?.settings
        .arguments ?? {}) as Map<dynamic, dynamic>;

    item = data['item'];

    firstAccess = false;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(item.title),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: size.width,
                    height: 160,
                    child: Hero(
                        tag: item.id,
                        child: Image.asset('assets/${item.image}')
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

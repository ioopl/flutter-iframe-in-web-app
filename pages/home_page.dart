import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_web/pages/test_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TestWidget(
              label: '',
              msg: '',
              onTap: (val){},
            ),
          ],
        ),
      ),
    );
  }

}

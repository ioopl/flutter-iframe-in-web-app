import 'package:flutter/material.dart';
import 'dart:html' as html;

class TestWidget extends StatefulWidget {
  final String label;
  String? msg;
  final Function(String)? onTap;

  TestWidget({Key? ke, this.label = '',this.msg, this.onTap});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width * 0.48,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.teal),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A Flutter Widget that receive string from web',
            style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text('${widget.msg}'),
          ),
          Text(
            'Label: ${widget.label}',
            style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                onTapSend();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapSend() {
    html.window.postMessage('==data sent==','*');
    setState(() {
      widget.msg = 'ABC';
    });
    widget.onTap!.call(widget.msg!);
  }
}

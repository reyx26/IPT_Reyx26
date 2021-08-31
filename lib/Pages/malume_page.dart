import 'package:flutter/material.dart';

class MalumePage extends StatefulWidget {
  MalumePage({Key? key}) : super(key: key);

  @override
  _MalumePageState createState() => _MalumePageState();
}

class _MalumePageState extends State<MalumePage> {
  int _counter = 0;

  _incrimentCounter(){
    setState(() {
              _counter++;
            });
            print('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.person),
          title: Text('MALUME'),
          actions: [
            IconButton(
                onPressed: () {
                  print("I LOVE CHELSEA");
                },
                icon: Icon(Icons.more_vert)),
            IconButton(
                onPressed: () {
                  print("I LOVE ME");
                },
                icon: Icon(Icons.alarm_on)),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pressed button these many times'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4)
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrimentCounter,
          
          child: Icon(Icons.add),
        ));
  }
}

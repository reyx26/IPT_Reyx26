import 'package:auntie_rafiki/Components/round_button.dart';
import 'package:flutter/material.dart';

class BoomColorChanger extends StatefulWidget {
  const BoomColorChanger({Key? key}) : super(key: key);

  @override
  _BoomColorChangerState createState() => _BoomColorChangerState();
}

class _BoomColorChangerState extends State<BoomColorChanger> {
  Color _backgroundColor = Colors.purple;
  List<Color> _colorlist = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _backgroundColor,
          leading: Icon(
            Icons.color_lens,
            size: 60,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Boom - color changer magic!',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Spacer(),
          Container(
            height: 100,
            child: ListView.builder(
                itemCount: _colorlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RoundButton(
                      onTap: () {
                        setState(() {
                          _backgroundColor = _colorlist[index];
                        });
                      },
                      color: _colorlist[index],
                    ),
                  );
                }),
          ),
          Spacer()
        ]));
  }
}

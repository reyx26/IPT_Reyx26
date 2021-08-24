import 'package:flutter/material.dart';

class HomaPage extends StatelessWidget {
  const HomaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INDUSTRIAL PROJECTS'),
        //leading: Icon(Icons.menu),
      ),
      body: (Column(
        children: [
          Text(
            'DAR ES SALAAM INSTITUTE OF TECHNOLGY',
            style: TextStyle(fontSize: 17),
          ),
          Image.asset('assets/images/dit.png')
        ],
      )),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        color: Colors.lightBlue,
        child: ListView(
          children: [
            // AppBar(
            //   title: Text('Malume'),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text('Reyx26'),
              accountEmail: Text('geofreyx26@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/mimi.jpg'),
              ),
            ),
            ListTile(
              //leading: CircleAvatar(backgroundColor: Colors.white,),
              leading: Icon(Icons.check),
              title: Text(
                'Boom Color Changer',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('boom_color_changer');
              },
            ),
          ],
        ),
      ),
    );
  }
}

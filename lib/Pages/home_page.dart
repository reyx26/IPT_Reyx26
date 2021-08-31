import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INDUSTRIAL PROJECT'),
        //leading: Icon(Icons.menu),
      ),
      body: (Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Text(
              'DAR ES SALAAM INSTITUTE OF TECHNOLGY',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            child: Image.asset(
              'assets/images/dit.png',
              height: 76,
              width: 70,
            ),
            color: Colors.blue,
          )
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
            ListTile(
              //leading: CircleAvatar(backgroundColor: Colors.white,),
              leading: Icon(Icons.check),
              title: Text(
                'Events',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('events');
              },
            ),
            ListTile(
              //leading: CircleAvatar(backgroundColor: Colors.white,),
              leading: Icon(Icons.check),
              title: Text(
                'Malume',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('malume_page');
              },
            ),
            SizedBox(height: 370),
            ListTile(
              //leading: CircleAvatar(backgroundColor: Colors.white,),
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('login_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}

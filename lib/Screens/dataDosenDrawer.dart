import 'package:flutter/material.dart';
import 'package:project_uas/Screens/getDatasDosen.dart';
import 'package:project_uas/Screens/registerDataDosen.dart';

class dosenDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return dosenDrawerState();
  }
}

class dosenDrawerState extends State<dosenDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Dosen Management'),
      ),
      body: Center(child: Text('Welcome To Data Dosen Management')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Data Dosen Management'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Register Data Dosen Management'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registerDataDosen()));
              },
            ),
            ListTile(
              title: Text('Get Data Dosen Management'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getDataDosens()));
              },
            )
          ],
        ),
      ),
    );
  }
}

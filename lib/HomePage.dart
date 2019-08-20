import 'package:flutter/material.dart';

import 'HomePageBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bloc = HomePageBloc();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Como funciona",
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Incrementa 10"),
              leading: Icon(Icons.ac_unit),
              subtitle: Text("Menu um"),
              onTap: () {
                _bloc.increment(10);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Incrementa 20"),
              leading: Icon(Icons.print),
              subtitle: Text("Menu dois"),
              onTap: () {
                _bloc.increment(20);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Incrementa 30"),
              leading: Icon(Icons.map),
              subtitle: Text("Menu tres "),
              onTap: () {
                _bloc.increment(30);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: StreamBuilder(
              stream: _bloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    child: Container(
                      color: Colors.lightGreen,
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          "${snapshot.data}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _bloc.increment(1);
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.close();
    super.dispose();
  }
}

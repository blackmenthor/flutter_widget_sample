import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list = List.generate(5, (i) => "${i}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Widget Sample',
        ),
      ),
      body: ReorderableListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        children: _list
            .map((String string) => Padding(
                  key: Key(
                    _list[_list.indexOf(string)],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    tileColor: _list.indexOf(string) % 2 == 0
                        ? Colors.blue
                        : Colors.red,
                    title: Text(
                      string,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
            .toList(),
        onReorder: (oldIndex, newIndex) {
          String old = _list[oldIndex];
          if (oldIndex > newIndex) {
            for (int i = oldIndex; i > newIndex; i--) {
              _list[i] = _list[i - 1];
            }
            _list[newIndex] = old;
          } else {
            for (int i = oldIndex; i < newIndex - 1; i++) {
              _list[i] = _list[i + 1];
            }
            _list[newIndex - 1] = old;
          }
          setState(() {});
        },
      ),
    );
  }
}

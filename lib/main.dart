import 'package:flutter/material.dart';
import 'package:flutter_basic/route/CountDemo.dart';
import 'package:flutter_basic/route/Douban.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text("Flutter App")),
        body: new MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return GridView.count(
      //水平子Widget之间间距
      crossAxisSpacing: 10.0,
      //垂直子Widget之间间距
      mainAxisSpacing: 30.0,
      //GridView内边距
      padding: EdgeInsets.all(10.0),
      //一行的Widget数量
      crossAxisCount: 3,
      //子Widget宽高比例
      childAspectRatio: 2.0,
      //子Widget列表
      children: getWidgetList(),
    );
  }


  List<String> getDataList() {
    List<String> list = [];
    list.add("DouBanList");
    list.add("CountDemo");
    list.add("value");
    list.add("value");
    list.add("value");
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return new GestureDetector(
      onTap: (){
        _jumpInto(item);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          item,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Colors.blue,
      ),
    );
  }

  void _jumpInto(String text){
    print("jumpTo "+text);
    switch(text){
      case "DouBanList":
        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return DouBanListView();
            }));
        break;
      case "CountDemo":
        Navigator.push( context,
            MaterialPageRoute(builder: (context) {
              return CountDemo();
            }));
        break;
      default:
        break;
    }



  }
}

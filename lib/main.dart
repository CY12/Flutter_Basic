import 'package:flutter/material.dart';
import 'package:flutter_basic/route/AutoWidget.dart';
import 'package:flutter_basic/route/CountDemo.dart';
import 'package:flutter_basic/route/Douban.dart';
import 'package:flutter_basic/route/HttpDemo.dart';
import 'package:flutter_basic/route/Visibility.dart';

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
    list.add("Http");
    list.add("Count");
    list.add("Visibility");
    list.add("AutoWidget");
    list.add("value");
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return ElevatedButton(
      child: Text(item),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF2196F3)),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(Color(0xffffffff)),
        //字体颜色
        overlayColor: MaterialStateProperty.all(Color(0xffFFF8E5)),
        // 高亮色
        shadowColor: MaterialStateProperty.all(Color(0xffffffff)),
        //阴影颜色
        elevation: MaterialStateProperty.all(0),
        //阴影值
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
        //字体
        side: MaterialStateProperty.all(
            BorderSide(width: 1, color: Color(0xffffffff))),
        //边框
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0))), //圆角弧度
      ),
      onPressed: () {
        _jumpInto(item);
      },
    );
    // return new GestureDetector(
    //   onTap: (){
    //     _jumpInto(item);
    //   },
    //   child: Container(
    //     alignment: Alignment.center,
    //     child: Text(
    //       item,
    //       style: TextStyle(color: Colors.white, fontSize: 20),
    //     ),
    //     color: Colors.blue,
    //   ),
    // );
  }

  void _jumpInto(String text) {
    print("jumpTo " + text);
    switch (text) {
      case "Http":
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NetDioSimpleDemoPage();
        }));
        break;
      case "Count":
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CountDemo();
        }));
        break;
      case "Visibility":
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OffstageDemo();
        }));
        break;
      case "AutoWidget":
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return GradientButtonRoute ();
        }));
        break;
      default:
        break;
    }
  }
}

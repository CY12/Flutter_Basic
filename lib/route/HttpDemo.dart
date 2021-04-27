import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/bean/PostListBean.dart';
import 'package:flutter_basic/http/DioManager.dart';
import 'package:flutter_basic/util/ColorUtil.dart';
import 'package:flutter_basic/util/ToastUtil.dart';

/*
 * 网络Dio库的使用
 */
class NetDioSimpleDemoPage extends StatefulWidget {
  @override
  _NetDioSimpleDemoPageState createState() => _NetDioSimpleDemoPageState();
}

class _NetDioSimpleDemoPageState extends State<NetDioSimpleDemoPage> {
  var _items = []; //热卖实体类
  int _counter = 0;
  PostListBean postListBean; //更新热卖商品返回bean

  void _testPost() async {
    DioManager.getInstance().post(
        'getPostList',
        FormData.fromMap({
          "start": "0",
          "size": "20",
        }),
        //正常回调
        (data) {
      setState(() {
        //更新UI等
        setState(() {
          print("更新UI postListBean" + postListBean.toString());
          postListBean = PostListBean.fromJson(data);
          _counter = postListBean.data.length;
        });
      });
    },
        //错误回调
        (error) {
      print("网络异常，请稍后重试");
    });
  }

  @override
  void initState() {
    super.initState();
    _testPost();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("HttpDemo"),
        ),
        body: ListView.builder(itemCount: _counter, itemBuilder: buildItem));
  }

  Widget buildItem(BuildContext context, int index) {
    Widget body = Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  postListBean.data[index].avatar,
                  width: 38,
                  height: 38,
                ),
                Container(
                  height: 38,
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        postListBean.data[index].name,
                        style: TextStyle(
                            color: ColorsUtil.hexToColor("#999999"),
                            fontSize: 12),
                      ),
                      Text(
                        postListBean.data[index].createtime.substring(5, 16) +
                            " 更新",
                        style: TextStyle(
                            color: ColorsUtil.hexToColor("#999999"),
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  postListBean.data[index].title,
                  style: TextStyle(
                      color: ColorsUtil.hexToColor("#333333"), fontSize: 12),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  postListBean.data[index].content,
                  style: TextStyle(
                      color: ColorsUtil.hexToColor("#333333"), fontSize: 12),
                )),
            if (postListBean.data[index].urlList.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.network(
                  postListBean.data[index].urlList[0],
                  width: 250,
                  fit: BoxFit.fitWidth,
                ),
              )
          ],
        ));

    return body;
  }
}

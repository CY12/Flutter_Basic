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
          print("更新UI postListBean"+postListBean.toString());
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
    return new ListView.builder(itemCount: _counter, itemBuilder: buildItem);
  }

  Widget buildItem(BuildContext context, int index) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
          ),
          child: Row(
            children: [
              Image.asset(postListBean.data[index].avatar,
                width: 100.0,
              ),
              Column(
                children: [
                  Text(postListBean.data[index].name,
                    style: TextStyle(
                      color: ColorsUtil.hexToColor("#999999"),
                    ),
                  ),
                  Text(postListBean.data[index].createtime.substring(5,16)+" 更新",
                    style: TextStyle(
                      color: ColorsUtil.hexToColor("#999999"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Text(postListBean.data[index].title),
        Text(postListBean.data[index].content)

      ],

    );
  }
}

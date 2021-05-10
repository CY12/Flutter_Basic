import 'package:flutter/material.dart';
import 'package:flutter_basic/util/ToastUtil.dart';
import 'package:flutter_basic/widget/GradientButton.dart';
import 'package:flutter_basic/widget/LoadingWidget.dart';

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.orange, Colors.red],
            height: 50.0,
            child: Text("Submit"),
            onPressed: () => onTap("orange"),
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onPressed: () => onTap("lightGreen"),
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            child: Text("Submit"),
            onPressed: () => onTap("lightBlue"),
          ),
          AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                return GradientCircularProgressIndicator(
                  colors: [Colors.blue, Colors.blue],
                  radius: 50.0,
                  strokeWidth: 3.0,
                  value: _animationController.value,
                );
              }),
        ],
      ),
    );
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("HttpDemo"),
        ),
        body: body);
  }

  onTap(String s) {
    print(s);
    ToastUtils.toast(context, msg: "你点击了" + s);
  }
}

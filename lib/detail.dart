import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final String id;
  final String title;

  // 构造传参，传入点击的item对应的电影id和名称，根据这两个参数去请求不同的详情内容
  MovieDetail({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _MovieDetailState createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
//    return Text("测试点击事件${widget.id},,${widget.title}");
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Text(
              "电影id:${widget.id}",
              style: TextStyle(fontSize: 22),
            )));
  }
}
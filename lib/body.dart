// import 'package:flutter/material.dart';
// import './detail.dart';
//
// // 导入网络请求框架
// import "package:dio/dio.dart";
//
// // ctrl + alt + L 格式化代码
// Dio dio = new Dio();
//
// // 创建一个电影列表控件 是可变状态控件 需要创建一个状态管理类
// class MovieList extends StatefulWidget {
//   final String tabFlag;
//
//   // 构造函数的固定写法
// //  MovieList({Key key}): super(key : key);
//   // 带传参的构造函数写法 @required 表示此参数为必传项
//   MovieList({Key key, @required this.tabFlag}) : super(key: key);
//
//   // 固定格式和写法
//   @override
//   _MovieListState createState() {
//     return _MovieListState();
//   }
// }
//
// // 状态管理的的固定格式和写法 如果想要有保存当前状态能力用with keepalive
// class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin{
//
//   // 默认显示第一页
//   int page = 1;
//   // 每一页显示十条数据
//   int pageSize = 10;
//   // 电影列表数据
//   var movieList = [];
//
//   @override
//   bool get wantKeepAlive => true;
//
//   // 控件被创建的时候会执行initState此生命周期方法
//   @override
//   void initState() {
//     super.initState();
//     // 请求网络获取电影列表数据
//     getMovieList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // 如果在状态管理类要使用控件的传参 需要使用widget.来调用私有数据使用
// //    return Text("tabFlag:${widget.tabFlag},---${movieList.length}");
//     // ListView只能展示代码写死的内容，不能动态更改，ListView.builder可以动态更改
//     return ListView.builder(
//       itemCount: movieList.length,
//       itemBuilder: (BuildContext context, int index) {
//         var movieItem = movieList[index];
//         // This function has a return type of 'Widget', but doesn't end with a return statement
//         // 如果有些属性添加不了，就想着在外面套一层Container
//         return GestureDetector(
//             onTap: () {
// //              print("测试点击事件");
//               // 给点击事件添加路由跳转地址
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
// //                return Text("测试点击事件");
//                     return MovieDetail(
//                         id: movieItem["id"], title: movieItem["title"]);
//                   }));
//             },
//             child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     border: Border(bottom: BorderSide(color: Colors.black12))),
//                 // 返回一个行展示数据
//                 child: Row(
//                   children: <Widget>[
//                     Image(
//                         image: NetworkImage(movieItem["images"]["small"]),
//                         width: 130,
//                         height: 180,
//                         fit: BoxFit.cover),
//                     Container(
//                         padding: EdgeInsets.only(left: 10),
//                         height: 180,
//                         child: Column(
//                           // 横向属性设置 居左对齐
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           // 纵向属性设置 居中对齐
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             Text("电影名称：${movieItem["title"]}"),
//                             Text("上映年份：${movieItem["year"]}年"),
//                             // 集合中参数要添加的内容用join插入
//                             Text("电影类型：${movieItem["genres"].join("*")}"),
//                             Text("豆瓣评分：${movieItem["rating"]["average"]}"),
//                             Row(children: <Widget>[
//                               Text("主要演员："),
//                               CircleAvatar(
//                                   backgroundImage: NetworkImage(
//                                       movieItem["casts"][0]["avatars"]
//                                       ["small"]))
//                             ])
//                           ],
//                         ))
//                   ],
//                 )));
//       },
//     );
//   }
//
//   // 获取电影列表数据的方法
//   getMovieList() async {
//     // 模版字符串 两种表现方式${.}和$
//     // 偏移量计算公式 (page - 1) * pageSize
//     int offSet = (page - 1) * pageSize;
//     // 请求网络需要异步 sync和await搭配使用
//     var response = await dio.get(
//       // http://www.liulongbin.top:3005/api/v2/movie/top250?start=0&count=1
//         "http://www.liulongbin.top:3005/api/v2/movie/${widget.tabFlag}?start=$offSet&count=$pageSize");
//     // 服务器返回的真正数据
//     var data = response.data;
//     print("data:${data.toString()}");
//     // 网络上请求的数据都需要在setState方法中进行私有数据的赋值，否则页面不会更新
//     setState(() {
//       // 数据实体中的键需要通过[]进行匹配调用
//       // 把subjects 数据赋值给了movieList 其他地方使用直接取出来就可以了
//       movieList = data["subjects"];
//       pageSize = data["total"];
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hello_world/const/const.dart';
import 'package:hello_world/router/router.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<Widget> imageWidgetList = List();

  @override
  void initState() {
    // 初始化轮播图数据
    for (int i = 0; i < 2; i++) {
      imageWidgetList.add(Image.network(
          Const.BaseURL + 'projectImg/lunbo' + (i + 1).toString() + '.jpg',
          fit: BoxFit.fill));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Const.AppBarTitle),
          backgroundColor: Const.AppBarBgColor,
        ),
        body: Column(
          children: <Widget>[
            Container(height: 200, child: _initSwiperWidget()),
            _initTabPaneWidget()
          ],
        ));
  }

  // Swiper
  Widget _initSwiperWidget() {
    return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return imageWidgetList[index];
        },
        duration: 600,
        itemCount: imageWidgetList.length,
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.0, right: 0.0),
            builder: SwiperPagination.dots));
  }

  // 选项卡
  Widget _initTabPaneWidget() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 0.5),
      itemBuilder: (BuildContext context, int index) => Stack(
        children: <Widget>[
          Offstage(
              child: GestureDetector(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0.5, bottom: 0.5),
                          child: Container(
                              width: double.infinity,
                              child: Text('测试',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Router.push(context, Router.detailPage, '');
                  }))
        ],
      ),
    );
  }

  // 列表
  Widget _initListWidget() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          height: 100,
          child: Text('项目'),
        ),
      ],
    );
  }

  // loadData() async {
  //   String loadRUL = "https://api.douban.com/v2/movie/in_theaters";
  //   http.Response response = await http.get(loadRUL);
  //   var result = json.decode(response.body);
  //   setState(() {
  //     title = result['title'];
  //     print('title: $title');
  //     subjects = result['subjects'];
  //   });
  // }
}

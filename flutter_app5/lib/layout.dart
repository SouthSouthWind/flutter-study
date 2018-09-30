import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main(){
  debugPaintSizeEnabled=true;
  runApp(new MixLayoutApp());
}
//行列对齐，调整布局
/*
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var imageRow=new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  */
/*            children:[
                new Image.asset('images/lake.jpg',width: 100.0,height: 50.0,),
                new Image.asset('images/lake.jpg',width: 100.0,height: 50.0,),
                new Image.asset('images/lake.jpg',width: 100.0,height: 50.0,),
                new Image.asset('images/lake.jpg',width: 100.0,height: 50.0,),

              ],*//*


      //将行或者列的子项放在Expandedwidget中，以控制腌着主轴方向的widget大小
      children: [
        new Expanded(child: new Image.asset('images/lake.jpg'),),
        new Expanded(child: new Image.asset('images/lake.jpg'),),
        new Expanded(child: new Image.asset('images/lake.jpg'),),

      ],
    );
    var packedRow=new Row(
      mainAxisSize: MainAxisSize.min,
     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
        new Icon(Icons.star,color: Colors.green[500],),
        new Icon(Icons.star,color: Colors.green[500],),
        new Icon(Icons.star,color: Colors.green[500],),
        new Icon(Icons.star,color: Colors.black,),
        new Icon(Icons.star,color: Colors.black,),
      ],
    );
    return new MaterialApp(
      title: 'gggggg',
      home: new Scaffold(
        appBar:new AppBar(
          title:new Text('hahahaa'),
        ),
        body:new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageRow,
              packedRow
            ],
          ),
        )
      ),
    );
  }
}
*/


//嵌套行和列
class MixLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Firebase operation",
      home:  new MyHomePage(),
    );
  }
}
class MyHomePage  extends StatefulWidget{
  @override
  _MyHomePageState createState()=>new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage >{
  @override
  Widget build(BuildContext context){
    var titleText=new Text('Strawberry Pavlova');
    var subTitle=new Text(
        'djfsfjdnfjjtjewjeiworjerfdnmgfnbmnfmverw',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 25.0
        ),
    );
    var ratings=new Container(
      padding: new EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
      child:new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize:MainAxisSize.min,
            children:[
              new Icon(Icons.star,color: Colors.black,),
              new Icon(Icons.star,color: Colors.black,),
              new Icon(Icons.star,color: Colors.black,),
              new Icon(Icons.star,color: Colors.black,),
              new Icon(Icons.star,color: Colors.black,),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0
            ),
          ),
        ],
      ),
    );
    var descTextStyle=new TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 18.0,
        height: 2.0
    );
    //DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其所有子节点继承
    var iconList=DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: new EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen,color: Colors.green[500],),
                  new Text('PReP'),
                  new Text('25 min'),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen,color: Colors.green[500],),
                  new Text('PReP'),
                  new Text('25 min'),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen,color: Colors.green[500],),
                  new Text('PReP'),
                  new Text('25 min'),
                ],
              ),
            ],
          ),
        )
    );
    var leftColumn=new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );
    var mainImage=new Image.asset('images/lake.jpg');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('hhhhh'),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0,0.0),
          height: 600.0,
          child:new Card(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 440.0,
                  child: leftColumn,
                ),
                mainImage
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}



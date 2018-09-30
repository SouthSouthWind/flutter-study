import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main(){
  //debugPaintSizeEnabled=true;
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Widget titlesSection=new Container(
      padding:const EdgeInsets.all(32.0),
      child:new Row(
        children:[
          new Expanded(
            child:new Column(
              crossAxisAlignment:CrossAxisAlignment.start, //列中子项左对齐
              children:[
                new Container(
                  padding:const EdgeInsets.only(bottom:8.0),
                  child:new Text(
                    'oeschinen Lake',
                    style:new TextStyle(
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg,Switzerland',
                  style:new TextStyle(
                    color:Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color:Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    Column buildButtonColumn(IconData icon,String label){  //创建一个颜色外primary color，包含一个icon和text的Widget列
      Color color=Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize:MainAxisSize.min,
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
         new Icon(icon,color:color),
         new Container(
           margin:const EdgeInsets.only(top:8.0),
           child:new Text(
             label,
             style:new TextStyle(
               fontSize: 12.0,
               fontWeight: FontWeight.w400,
               color:color,
             )
           )
         )
        ],
      );
    }
    Widget buttonSection=new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平均分配每个列占据的行空间
        children:[
          buildButtonColumn(Icons.call, 'call'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share,'SHARE'),
        ],
      ),
    );
    Widget textSection=new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
      lake oesffg lies at the foot of the Blurnefn in the er  tttttttttt   
        ''',
        softWrap:true //softWrap属性表示是否应该在软换行符（例如句点或逗号）之间断开
      ),
    );

    return new MaterialApp(
      title: 'flutter Demo',
      theme:new ThemeData(
        primarySwatch:Colors.blue,

      ),
      home: new Scaffold(
        body:new ListView(
          children:[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit:BoxFit.cover, //BoxFit.cover告诉框架，图像应该尽可能小，但覆盖整个渲染框
            ),
            titlesSection,
            buttonSection,
            textSection,
          ],
        ),
      ),

    );
  }
}
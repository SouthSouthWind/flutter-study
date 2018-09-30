import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//创建一个无限滚动的listView
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'startup Name Generator',
      //更改主题色
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}

//有状态widget
class RandomWords extends StatefulWidget{
  @override
  createState()=>new RandomWordsState();
  
}
class RandomWordsState extends State<RandomWords>{
  /* dart语言中，使用下划线前缀标识符会强制其变成私有的*/
  final _suggestions=<WordPair>[]; //保存建议的单词对
  final _biggerFont=const TextStyle(fontSize: 18.0);//增加字体大小
  final _saved=new Set<WordPair>();//添加一个_saved Set(集合)到RandomWordState，该集合存储用户喜欢的单词对，在这里Set比list更合适，因为set中不允许重复的值

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title:new Text('Startup Name Generator'),
        //为AppBar添加一个列表图标
        actions:<Widget>[
        new IconButton(icon:new Icon(Icons.list),onPressed:_pushSaved),
        ]
      ),
      body:_bulidSuggestions(),
    );
  }
  Widget _bulidSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      //每个单词对都会调用一次itemBuilder，然后将单词添加到ListTitle行中
      //在偶数行改函数为单词对添加一个ListTitle row
      //在奇数行，该行数会添加一个分割线widget，来分割相邻的词对
      //小屏幕上分割线看起来会比较吃力
      itemBuilder: (context,i){
        //在每一列之前，添加一个1像素高的分割线widget
        if(i.isOdd) return new Divider();
        //语法‘i~/2’表示i除以2，但返回值是整形（向下取整），比如i为：1，2，3，4，5时，结果为0，1，1，2，2
        //这可以计算出ListView减去分割线后实际单词对数量

        final index=i~/2;
        //如果是建议列表中最后一个单词对
        if(index>=_suggestions.length){
          //接着再生成十个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved=_saved.contains(pair);//添加alreadySaved来检查确保单词对还没有添加到收藏夹中

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //添加新型图标到ListTiles以启用收藏功能
      trailing:new Icon(
        alreadySaved?Icons.favorite:Icons.favorite_border,
        color:alreadySaved?Colors.red:null
      ),
      onTap: (){
        //在flutter的响应式风格的框架中，调用setState()会为State对象触发build()方法，从而导致对ui的更新
        setState((){
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });

      },
    );
  }
  void _pushSaved(){
    //添加Navigatoe.push调用，这会使路由入栈
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles=_saved.map(
              (pair){
                return new ListTile(
                  title:new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  )
                );
              }
           );
          final divided=ListTile
              .divideTiles(
                context:context,
                tiles:tiles,
              )
              .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('saved suggestions'),
            ),
            body:new ListView(children: divided,)
          );
        }
      )
    );
  }
}


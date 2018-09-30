import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//无状态widget
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair=new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello World'),
         // child: new Text(wordPair.asPascalCase),/*无状态*/
          child: new RandomWords(),
        ),
      ),
    );
  }
}

//有状态widget
class RandomWords extends StatefulWidget{
  @override
  createState()=>new RandomWordsState();

}
class RandomWordsState extends State<RandomWords>{
  @override
  Widget build(BuildContext context){
    final wordPair=new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}


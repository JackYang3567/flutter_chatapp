import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';


void getHttp() async {
  try {
    Response response = await Dio().get("http://http.767717.com:881/im/get/chatList");
    print(response);
  } catch (e) {
    print(e);
  }
}

class ChatList extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<ChatList> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 14.0);
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(4.0),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   // final wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);
    return new Scaffold (
     
      body: _buildSuggestions(),
    );
  }
}
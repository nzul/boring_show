import 'dart:async';

import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _articles = [
    18105129,
    18106224,
    18091929,
    18092279,
    18099795,
    18105375,
    18104861,
    18104879,
    18104508,
    18104761,
    18106504,
    18105931,
    18097569
  ]; // articles;

  Future<Article> _getArticle(int id) async {
    final String storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final http.Response storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
//          setState(() {
//            _articles.removeAt(0);
//          });
        },
        child: ListView(
          children: _articles.map((articleId) =>
            FutureBuilder<Article>(
              future: _getArticle(articleId),
              builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _buildItem(snapshot.data);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            )
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.id.toString()),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 24.0),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(article.type),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(article.url)) {
                    launch(article.url);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

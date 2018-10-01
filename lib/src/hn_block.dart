import 'dart:async';
import 'dart:collection';

import 'package:boring_flutter/src/article.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class HackerNewsBloc {
  final _articleSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  var _articles = <Article>[];

  List<int> _ids = [
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

  HackerNewsBloc() {
    _updateArticles().then((_) {
      _articleSubject.add(UnmodifiableListView(_articles));
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articleSubject.stream;

  Future<Article> _getArticle(int id) async {
    final String storyUrl =
        'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final http.Response storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    _articles = await Future.wait(futureArticles);
  }
}

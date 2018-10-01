import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  @nullable
  bool get deleted;

  String get type; // "job", "story", "comment", "poll", or "pollopt"

  String get by;

  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
  }

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final Article article =
  standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}


//class Article {
//  final String text;
//  final String domain;
//  final String by;
//  final String age;
//  final int score;
//  final int commentsCount;
//
//  const Article(
//      {this.text,
//      this.domain,
//      this.by,
//      this.age,
//      this.score,
//      this.commentsCount});
//}
//
//final articles = [
//  new Article(
//    text:
//        'Circular Shock Acoustic Waves in Ionosphere Triggered by Launch of Formosat-5',
//    domain: 'wiley.com',
//    by: 'zdw',
//    age: '3 hours',
//    score: 177,
//    commentsCount: 62,
//  ),
//  new Article(
//    text: 'BMW says electric car mass production not viable until 2020',
//    domain: 'reuters.com',
//    by: 'Mononokay',
//    age: '2 hours',
//    score: 81,
//    commentsCount: 128,
//  ),
//  new Article(
//    text: 'TCP Tracepoints have arrived in Linux',
//    domain: 'brendangregg.com',
//    by: 'brendangregg',
//    age: '1 hours',
//    score: 35,
//    commentsCount: 0,
//  ),
//  new Article(
//    text:
//        'Section 230: A Key Legal Shield for Facebook, Google Is About to Change',
//    domain: 'npr.org',
//    by: 'Mononokay',
//    age: '5 hours',
//    score: 156,
//    commentsCount: 6,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//  new Article(
//    text: 'A Visiting Star Jostled Our System 70,000 Years Ago',
//    domain: 'gizmodo.com',
//    by: 'rbanffy',
//    age: '7 hours',
//    score: 175,
//    commentsCount: 53,
//  ),
//];

import 'dart:convert';

class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  /*create a new instance of an object with updated properties.
  if you given new object its given new object else given old
  It is commonly used in immutable data models to make changes to an object while maintaining immutability.*/
  Posts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Posts(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  /*Json Object to Map*/
  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'body': this.body,
    };
  }

  /*Map to Json Object*/
  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  /*Convert Map To Json*/
  String toJson() => json.encode(toMap());

  /*Convert Json To Map*/
  factory Posts.fromJson(String source) =>
      Posts.fromMap(json.decode(source) as Map<String, dynamic>);
}

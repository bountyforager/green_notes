
class GreenContent {
  int? postId;
  int? id;
  String name;
  String? email;
  String body;

  GreenContent({
    this.postId,
    this.id,
    required this.name,
    this.email,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory GreenContent.fromMap(Map<String, dynamic> json) {
    return GreenContent(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => toMap();
  
      factory GreenContent.fromJson(Map<String, dynamic> source) =>
      GreenContent.fromMap(source);
}

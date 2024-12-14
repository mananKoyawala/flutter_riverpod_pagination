class Comments {
  final int id;
  final String body;
  final int likes;

  Comments({required this.id, required this.body, required this.likes});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(id: json["id"], body: json["body"], likes: json["likes"]);
  }
}

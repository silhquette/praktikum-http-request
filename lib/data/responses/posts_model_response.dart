class PostsModelResponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostsModelResponse({required this.userId,
    required this.id,
    required this.title,
    required this.body});

  factory PostsModelResponse.fromJson(Map<String, dynamic> json) => PostsModelResponse(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]
  );
}
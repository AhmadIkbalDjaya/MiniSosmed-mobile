class Posts {
  int? id;
  String? userId;
  String? username;
  String? body;
  String? image;
  String? updatedAt;
  String? name;
  int? likeCount;
  int? hasLike;
  int? commentCount;
  List<Comment>? comment;

  Posts(
      {this.id,
      this.userId,
      this.username,
      this.body,
      this.image,
      this.updatedAt,
      this.name,
      this.likeCount,
      this.hasLike,
      this.commentCount,
      this.comment});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    username = json['username'];
    body = json['body'];
    image = json['image'];
    updatedAt = json['updated_at'];
    name = json['name'];
    likeCount = json['like_count'];
    hasLike = json['hasLike'];
    commentCount = json['comment_count'];
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['body'] = this.body;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['like_count'] = this.likeCount;
    data['hasLike'] = this.hasLike;
    data['comment_count'] = this.commentCount;
    if (this.comment != null) {
      data['comment'] = this.comment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  int? id;
  String? userId;
  String? postId;
  String? body;
  String? createdAt;
  String? name;

  Comment(
      {this.id,
      this.userId,
      this.postId,
      this.body,
      this.createdAt,
      this.name});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    body = json['body'];
    createdAt = json['created_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    return data;
  }
}

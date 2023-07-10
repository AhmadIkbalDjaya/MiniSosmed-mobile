class Posts {
  int? id;
  int? userId;
  String? body;
  Null? image;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Comment>? comment;
  List<Like>? like;

  Posts(
      {this.id,
      this.userId,
      this.body,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.comment,
      this.like});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    body = json['body'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(new Comment.fromJson(v));
      });
    }
    if (json['like'] != null) {
      like = <Like>[];
      json['like'].forEach((v) {
        like!.add(new Like.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['body'] = this.body;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.comment != null) {
      data['comment'] = this.comment!.map((v) => v.toJson()).toList();
    }
    if (this.like != null) {
      data['like'] = this.like!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Comment {
  int? id;
  int? userId;
  int? postId;
  String? body;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment(
      {this.id,
      this.userId,
      this.postId,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    body = json['body'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Like {
  int? id;
  int? userId;
  int? postId;
  Null? createdAt;
  Null? updatedAt;
  User? user;

  Like(
      {this.id,
      this.userId,
      this.postId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Like.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

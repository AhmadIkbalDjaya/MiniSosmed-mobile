class Users {
  int? id;
  String? username;
  String? name;
  String? profileImage;
  int? followers;
  int? follows;
  bool? hasFollow;

  Users(
      {this.id,
      this.username,
      this.name,
      this.profileImage,
      this.followers,
      this.follows,
      this.hasFollow});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    profileImage = json['profile_image'];
    followers = json['followers'];
    follows = json['follows'];
    hasFollow = json['has_follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['followers'] = this.followers;
    data['follows'] = this.follows;
    data['has_follow'] = this.hasFollow;
    return data;
  }
}

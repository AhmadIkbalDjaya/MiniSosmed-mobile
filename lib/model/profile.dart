class Profile {
  int? id;
  String? username;
  String? name;
  String? profileImage;
  String? coverImage;
  int? followers;
  int? follows;
  String? birthday;
  String? gender;
  String? address;

  Profile(
      {this.id,
      this.username,
      this.name,
      this.profileImage,
      this.coverImage,
      this.followers,
      this.follows,
      this.birthday,
      this.gender,
      this.address});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    profileImage = json['profile_image'];
    coverImage = json['cover_image'];
    followers = json['followers'];
    follows = json['follows'];
    birthday = json['birthday'];
    gender = json['gender'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['cover_image'] = this.coverImage;
    data['followers'] = this.followers;
    data['follows'] = this.follows;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['address'] = this.address;
    return data;
  }
}

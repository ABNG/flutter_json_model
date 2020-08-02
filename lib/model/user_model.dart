class User {
  String login;
  int id;
  String avatarUrl;

  User({
    this.login,
    this.id,
    this.avatarUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}

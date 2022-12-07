class PostTech {
  int? user;
  String? username;
  String? title;
  String? description;
  String? date;
  List<int>? likes;

  PostTech({
    this.user,
    this.username,
    this.title,
    this.description,
    this.date,
    this.likes,
  });

  PostTech.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    username = json['username'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    likes = json['likes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['username'] = username;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['likes'] = likes;
    return data;
  }
}

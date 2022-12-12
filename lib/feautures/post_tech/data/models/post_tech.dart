class PostTech implements Comparable<PostTech> {
  int? id;
  int? user;
  String? username;
  String? title;
  String? description;
  String? date;
  List<dynamic>? likes;

  PostTech({
    this.id,
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

  @override
  int compareTo(PostTech other) {
    if (likes!.length == other.likes!.length) {
      if (id! < other.id!) {
        return -1;
      } else {
        return 1;
      }
    } else if (likes!.length < other.likes!.length) {
      return 1;
    } else {
      return -1;
    }
  }
}

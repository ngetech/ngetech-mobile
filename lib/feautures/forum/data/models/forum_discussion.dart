class ForumDiscussion {
  int? id;
  String? title;
  String? content;
  String? user;
  String? date;

  ForumDiscussion({
    this.id,
    this.title,
    this.content,
    this.user,
    this.date,
  });

  ForumDiscussion.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    user = json['user'][0];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'content': content,
      'user': user,
      'date': date,
    };
    return data;
  }

  @override
  String toString() {
    return "{$id, $title, $content, $user, $date}";
  }
}

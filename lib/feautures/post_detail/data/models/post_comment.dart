// ignore_for_file: non_constant_identifier_names
class PostComment {
  int? user;
  String? username;
  String? created_on;
  int? post;
  String? comment;

  PostComment({
    this.user,
    this.username,
    this.created_on,
    this.post,
    this.comment,
  });

  PostComment.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    username = json['username'];
    created_on = json['created_on'];
    post = json['post'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['username'] = username;
    data['created_on'] = created_on;
    data['post'] = post;
    data['comment'] = comment;
    return data;
  }
}

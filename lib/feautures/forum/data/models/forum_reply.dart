class ForumReply {
  int? id;
  String? content;
  String? user;
  String? date;
  String? replyingTo;
  int? replyParentId;
  List<ForumReply>? replies;

  ForumReply({
    this.id,
    this.content,
    this.user,
    this.date,
    this.replyingTo,
    this.replyParentId,
  });

  ForumReply.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    user = json['user'];
    date = json['date'];
    replyingTo = json['replyingTo'];
    replyParentId = json['replyParentPk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'content': content,
      'user': user,
      'date': date,
      'replyingTo': replyingTo,
      'replyParentPk': replyParentId,
    };
    return data;
  }

  @override
  String toString() {
    return "{$id, $content, $user, $date, $replyingTo, $replyParentId}";
  }
}

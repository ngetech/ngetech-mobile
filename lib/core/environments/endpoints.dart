class EndPoints {
  static const String baseUrl = 'https://ngetech.up.railway.app';
  static const String register = '$baseUrl/flutter-register-user/';
  static const String login = '$baseUrl/flutter-login-user/';
  static const String logout = '$baseUrl/flutter-logout-user/';
  static const String getPostsTech = '$baseUrl/post-tech/post-tech-json/';
  static const String addPostTech = '$baseUrl/post-tech/add-post-tech/';
  static const String getForumDiscussion = '$baseUrl/discussion/get/';
  static const String addForumDiscussion =
      '$baseUrl/discussion/create-discussion/post/';
  static String getForumReply(int id) => '$baseUrl/discussion/$id/replies/';
  static String addForumReply(int id) => '$baseUrl/discussion/$id/replies/add/';
  static String getNestedReply(int id) => '$baseUrl/discussion/replies/$id/';
  static String addNestedReply(int id) =>
      '$baseUrl/discussion/replies/$id/add/';
  static const String getCommentPostTech =
      '$baseUrl/post-detail/post-comment-json/';
  static const String addCommentPostTech =
      '$baseUrl/post-detail/add-post-comment/';
  static const String getPostLikesCount = '$baseUrl/post-tech/get-likes/';
  static const String addLike = '$baseUrl/post-tech/like-post/';
  static const String getTop5PostTech = '$baseUrl/top-5-post/top-post-json/';
}

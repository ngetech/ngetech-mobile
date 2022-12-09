import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/forum/data/models/forum_discussion.dart';
import 'package:ngetech/services/cookies_request.dart';

class ForumDiscussionRemoteDataSource {
  final CookieRequest request;

  ForumDiscussionRemoteDataSource({
    required this.request,
  });

  Future<List<ForumDiscussion>> fetchDiscussions() async {
    try {
      final List<ForumDiscussion> result = [];
      final response = await request.get(EndPoints.getForumDiscussion);
      for (var i in response) {
        ForumDiscussion discussion = ForumDiscussion.fromJson(i['fields']);
        discussion.id = i['pk'];
        result.add(discussion);
      }
      return result;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/forum/data/models/forum_reply.dart';
import 'package:ngetech/services/cookies_request.dart';

class ForumReplyRemoteDataSource {
  final CookieRequest request;

  ForumReplyRemoteDataSource({
    required this.request,
  });

  Future<List<ForumReply>> fetchReplies(int id) async {
    try {
      final List<ForumReply> result = [];
      final response = await request.get(EndPoints.getForumReply(id));
      for (var i in response["replies"]) {
        ForumReply reply = ForumReply.fromJson(i);
        reply.id = i['pk'];
        result.add(reply);
      }
      return result;
    } catch (e) {
      throw Exception('error: $e');
    }
  }

  Future<List<ForumReply>> fetchNestedReplies(int id) async {
    try {
      final List<ForumReply> result = [];
      final response = await request.get(EndPoints.getNestedReply(id));
      for (var i in response["replies"]) {
        ForumReply reply = ForumReply.fromJson(i);
        reply.id = i['pk'];
        result.add(reply);
      }
      return result;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

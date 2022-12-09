import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/post_detail/data/models/post_comment.dart';
import 'package:ngetech/services/cookies_request.dart';

class CommentRemoteDataSource {
  final CookieRequest request;

  CommentRemoteDataSource({
    required this.request,
  });

  Future<List<PostComment>> fetchComments({required int postId}) async {
    try {
      print(request.isLoggedIn());
      final List<PostComment> result = [];
      final response = await request.get(EndPoints.getCommentPostTech);
      for (var item in response) {
        if (item['pk'] == postId) {
          result.add(PostComment.fromJson(item['fields']));
        }
      }
      print(result.length);
      return result.toList();
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

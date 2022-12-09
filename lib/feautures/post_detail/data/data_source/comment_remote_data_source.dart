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
      final List<PostComment> result = [];
      final response = await request.get(EndPoints.getCommentPostTech);
      print('post id: $postId');
      for (var item in response) {
        if (item['fields']['post'] == postId) {
          result.add(PostComment.fromJson(item['fields']));
        }
      }
      return result.toList();
    } catch (e) {
      throw Exception('error: $e');
    }
  }

  Future<Map<String,dynamic>> getLikesCount({required int postId}) async {
    final response = await request.get('${EndPoints.getPostLikesCount}$postId/');
    print(response['likes_count']);
    return response;
  }
}

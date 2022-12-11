import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';

class PostTechRemoteDataSource {
  final CookieRequest request;

  PostTechRemoteDataSource({
    required this.request,
  });

  Future<List<PostTech>> fetchPosts() async {
    try {
      final List<PostTech> result = [];
      final response = await request.get(EndPoints.getPostsTech);
      for (var item in response) {
        PostTech post = PostTech.fromJson(item['fields']);
        post.id = item['pk'];
        result.add(post);
      }
      return result.toList();
    } catch (e) {
      throw Exception('error: $e');
    }
  }

  Future<Map<String, dynamic>> getLikesCount({required int postId}) async {
    final response = await request.get(
      '${EndPoints.getPostLikesCount}$postId/',
    );
    print(response['likes_count']);
    return response;
  }
}

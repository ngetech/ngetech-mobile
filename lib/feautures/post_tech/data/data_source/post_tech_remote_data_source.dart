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
      print(request.isLoggedIn());
      final List<PostTech> result = [];
      final response = await request.get(EndPoints.getPostsTech);
      for (var item in response) {
        result.add(PostTech.fromJson(item['fields']));
      }
      print(result.length);
      return result.toList();
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

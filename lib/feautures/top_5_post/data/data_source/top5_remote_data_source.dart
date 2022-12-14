import 'package:ngetech/core/environments/endpoints.dart';
import 'package:ngetech/feautures/post_tech/data/models/post_tech.dart';
import 'package:ngetech/services/cookies_request.dart';

class Top5RemoteDataSource {
  final CookieRequest request;

  Top5RemoteDataSource({
    required this.request,
  });

  Future<List<PostTech>> fetchTop5Post() async {
    try {
      List<PostTech> result = [];
      final response = await request.get(EndPoints.getPostsTech);
      for (var item in response) {
        PostTech post = PostTech.fromJson(item['fields']);
        post.id = item['pk'];
        result.add(post);
      }
      return result;
    } catch (e) {
      throw Exception('error: $e');
    }
  }
}

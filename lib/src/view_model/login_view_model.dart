import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/Posts.dart';
import '../repository/home_repository.dart';

class LoginViewModel {
  final _popularMovieRepo = HomeRepository();

  Future<List<Posts>> fetchPostsListApi() async {
    try {
      List<dynamic> postListResponse = await _popularMovieRepo.fetchSomeData();
      List<Posts> postList =
          List.from(postListResponse.map((element) => Posts.fromMap(element)));
      return postList;
    } catch (error) {
      throw Exception(error);
    }
  }
}

final loginViewModel = Provider<LoginViewModel>((ref) => LoginViewModel());

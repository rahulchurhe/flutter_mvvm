import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/CounterModel.dart';
import '../model/Posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CounterViewModel extends StateNotifier<CounterModel> {
  CounterViewModel() : super(CounterModel(0));

  void increment() {
    state = CounterModel(state.count + 1);
  }

  void deincrement() {
    state = CounterModel(state.count - 1);
  }
}

class CounterNotifierStat extends StateNotifier<int> {
  CounterNotifierStat() : super(0);

  void increment() {
    state++;
  }

  void deincrement() {
    state--;
  }
}

class CounterNotifierStatN extends StateNotifier<String> {
  CounterNotifierStatN() : super('');

  void getDate() {
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    state = currentDate.toString();
  }
}

class APIViewModel extends StateNotifier<List<Posts>> {
  APIViewModel(List<Posts> state) : super(state);

  Future<void> fetchPostsDataFutureProvider() async {
    List<Posts> postList = [];
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> postListResponse =
      convert.jsonDecode(response.body);
      for (var element in postListResponse) {
        Posts post = Posts.fromMap(element);
        postList.add(post);
      }
      state = postList;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }



}



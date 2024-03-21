import 'package:riverpod/riverpod.dart';

import '../model/CounterModel.dart';
import '../model/Posts.dart';
import '../view_model/conter_view_model.dart';
import '../view_model/login_view_model.dart';

final stateNotifierProvider =
    StateNotifierProvider<CounterNotifierStat, int>((ref) {
  return CounterNotifierStat();
});

final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, CounterModel>((ref) {
  return CounterViewModel();
});

final stateNotifierProviderD =
    StateNotifierProvider<CounterNotifierStatN, String>((ref) {
  return CounterNotifierStatN();
});

/*API calling Provider*/
/*final userDataProvider = FutureProvider.autoDispose<List<Posts>>((ref) async {
  return ref.read(loginViewModel).fetchPostsListAPIFutureProvider();
});*/

final userListDataProvider =
    FutureProvider.autoDispose<List<Posts>>((ref) async {
  return ref.read(loginViewModel).fetchPostsListApi();
});

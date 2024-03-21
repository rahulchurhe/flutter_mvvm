import '../network/network_api_services.dart';
import '../res/constant/url_constants.dart';

class HomeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> fetchSomeData() async {
    try {
      return await _apiServices.getGetApiResponse(UrlConstants.postsAPI);
    } catch (e) {
      rethrow;
    }
  }
}

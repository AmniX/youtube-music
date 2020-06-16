import 'package:music/data/models/youtube_search_response.dart';
import 'package:music/utils/network.dart';
import 'package:dio/dio.dart';

class YouTubeApi {
  String _apiKey;

  YouTubeApi(this._apiKey);

  Future<Response<dynamic>> search(String query, {int maxResults = 10}) async {
    return Network.getDio("https://www.googleapis.com/youtube/v3/").get(
      "search",
      queryParameters: {
        "part": "snippet",
        "maxResults": maxResults,
        "q": query,
        "key": _apiKey,
      },
    );
  }
}

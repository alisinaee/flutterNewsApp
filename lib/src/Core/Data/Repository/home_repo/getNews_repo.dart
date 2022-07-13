import 'dart:convert';

import 'package:ako_demo/src/Core/Data/Models/news_model.dart';
import 'package:ako_demo/src/Core/Services/connection/http_service.dart';

class NewsRepo {
  final String _newsUrl = 'https://newsdata.io/api/1/news?language=en';

  Future<NewsModel?> getNews() async {
    //
    var res = await Connection().getRequest(_newsUrl);

    //check for status
    if (res.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(res.body));
    } else {
      return null;
    }
  }
}

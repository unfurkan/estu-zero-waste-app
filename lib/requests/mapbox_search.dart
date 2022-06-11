import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_turn_by_turn/main.dart';

import '../helpers/dio_exceptions.dart';

String baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
String accessToken = dotenv.env['MAPBOX_ACCESS_TOKEN']!;
String searchType = 'place%2Cpostcode%2Caddress%2Cpoi';
String searchResultsLimit = '5';
/*String proximity =
    '${sharedPreferences.getDouble('longitude')}%2C${sharedPreferences.getDouble('latitude')}';*/
String country = 'tr';
String language = 'tr';
String bbox = '30.527268378387106%2C39.81215664337722%2C30.538644204565145%2C39.819829622150706';
String proximity = '-73.990593%2C40.740121';
String types = '-73.990593%2C40.740121';

Dio _dio = Dio();

Future getSearchResultsFromQueryUsingMapbox(String query) async {

  https://api.mapbox.com/geocoding/v5/mapbox.places/&types=place%2Cpostcode%2Caddress%2Cpoi&language=tr&access_token=YOUR_MAPBOX_ACCESS_TOKEN
  String url =
      '$baseUrl/$query.json?country=$country&bbox=$bbox&proximity$proximity&limit=$searchResultsLimit&language=$language&proximity=$proximity&types=$searchType&access_token=$accessToken';
  url = Uri.parse(url).toString();
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
    debugPrint(errorMessage);
  }
}

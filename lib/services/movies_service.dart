import 'dart:convert';

import 'package:sotaui/sotaui.dart';

import '../config/config.dart';
import 'models/models.dart';

class MoviesService {
  static Dio dio = Dio();

  static Future<GetAllMoviesModel> getAll(query) async {
    dynamic res;
    try {
      final Response response = await dio.get(
        Apis.movies + '/$query?api_key=34738023d27013e6d1b995443764da44',
        // options: await Api.header(),
      );
      logSui('Get All Movies', jsonEncode(response.data));
      if (response.statusCode == 200) {
        res = getAllMoviesModelFromJson(jsonEncode(response.data));
      } else {
        toastSui(response.data.message.toString(), seconds: 5);
      }
    } on DioError catch (e) {
      if (e.response != null) {
        toastSui(e.response!.data.toString(), seconds: 5);
      }
    }
    return res;
  }
}

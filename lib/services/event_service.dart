import 'dart:convert';

//import 'package:dio/dio.dart';

import 'package:geek_task/models/app_config.dart';
import 'package:geek_task/models/event.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class EventService {
  final GetIt getIt = GetIt.instance;

  String _base_url;
  String _client_id;

  EventService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _client_id = _config.CLIENT_ID;
  }
  Future<EventResponse> searchEvents(String _searchTerm, {int page}) async {
    var client = http.Client();
    var eventResponse;
    ;
    var url =
        Uri.parse('$_base_url/events?client_id=$_client_id&q=$_searchTerm');

    try {
      var _response = await client.get(url);
      if (_response.statusCode == 200) {
        var _data = _response.body;
        var decodedData = jsonDecode(_data);

        eventResponse = EventResponse.fromJson(decodedData);
      } else {
        throw Exception('Couldn\'t perform event search.');
      }
    } catch (e) {
      print('check error is $e');
      return eventResponse;
    }
    return eventResponse;
  }
}

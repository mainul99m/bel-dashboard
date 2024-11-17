import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bel_dashboard/controllers/shark_data_controller.dart';
import 'package:bel_dashboard/main.dart';
import 'package:bel_dashboard/models/login_response_model.dart';
import 'package:bel_dashboard/models/shark_data_model.dart';
import 'package:bel_dashboard/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

import '../constant/shared_prefs_constants.dart';

class RemoteService {
  static Future<LoginResponseModel?> login(String phoneNumber, String password) async {
    final url = ApiEndpoint.baseUrl + ApiEndpoint.auth.login;
    print(url);

    final data = {
      'phone': phoneNumber,
      'password': password,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Connection': 'keep-alive',
          'Accept': '*/*',
        },
        body: jsonEncode(data)
      );
      if (response.statusCode == 200) {
        return loginResponseModelFromJson(response.body);
      } else {
        return null;
      }
    } on SocketException{
      print('No Internet Connection');
    } on TimeoutException {
      print('Request Timed Out');
    } on http.ClientException {
      print('Client Exception');
    } catch (e) {
      print(e);
    }
  }


  static Future<SharkDataModel?> getSharks() async {
    final url = ApiEndpoint.baseUrl + ApiEndpoint.get.shark;
    print(url);

    final token = prefs.getString(SharedPrefsConstants.TOKEN);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Credentials': 'true',
          'Access-Control-Allow-Headers': 'Content-Type',
          'Connection': 'keep-alive',
          'Accept': '*/*',
          'Authorization' : 'Bearer $token'
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        return sharkDataModelFromJson(response.body);
      } else {
        return null;
      }
    } on SocketException{
      print('No Internet Connection');
    } on TimeoutException {
      print('Request Timed Out');
    } on http.ClientException {
      print('Client Exception');
    } catch (e) {
      print(e);
    }
  }
}
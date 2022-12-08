import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

class CookieRequest {
  static Map<String, String> headers = {};
  static Map<String, String> cookies = {};
  static Map<String, dynamic> jsonData = {};
  static final http.Client _client = http.Client();

  static late SharedPreferences local;

  static bool loggedIn = false;
  static bool initialized = false;
  static String? user;

  static Future init() async {
    if (!initialized) {
      local = await SharedPreferences.getInstance();
      String? savedCookies = local.getString("cookies");
      if (savedCookies != null) {
        cookies = Map<String, String>.from(json.decode(savedCookies));
        if (cookies['sessionid'] != null) {
          loggedIn = true;
          user = local.getString('user');
          headers['cookie'] = _generateCookieHeader();
        }
      }
    }
    initialized = true;
  }

  Future persist(String cookies) async {
    local.setString("cookies", cookies);
  }

  Future<dynamic> login(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }

    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);

    await _updateCookie(response);
    print('status code: ${response.statusCode}');
    print('response header: ${response.headers}');
    print('response body: ${response.body}');
    if (response.statusCode == 200) {
      loggedIn = true;
      jsonData = json.decode(response.body);
      user = jsonData['username'];
      local.setString('user', user!);
    } else {
      loggedIn = false;
    }

    // Expects and returns JSON request body
    return json.decode(response.body);
  }

  Future<dynamic> logout(String url) async {
    http.Response response = await _client.post(Uri.parse(url));

    print('status code: ${response.statusCode}');
    print('response header: ${response.headers}');
    print('response body: ${response.body}');

    if (response.statusCode == 200) {
      loggedIn = false;
      user = null;
      jsonData = {};
    } else {
      loggedIn = true;
    }

    cookies = {};
    headers = {};
    local.remove('user');
    local.remove('cookies');

    return json.decode(response.body);
  }

  Map<String, dynamic> getJsonData() {
    return jsonData;
  }

  Future<dynamic> get(String url) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.get(Uri.parse(url), headers: headers);
    await _updateCookie(response);
    // Expects and returns JSON request body
    return json.decode(response.body);
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    await _updateCookie(response);
    // Expects and returns JSON request body
    return json.decode(response.body);
  }

  Future<dynamic> postJson(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    // Add additional header
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    // Remove used additional header
    print('post header: $headers');
    print('post json status code: ${response.statusCode}');
    headers.remove('Content-Type');
    await _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future _updateCookie(http.Response response) async {
    // Solves LateInitializationError
    await init();

    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      String cookieObject = (const JsonEncoder()).convert(cookies);
      persist(cookieObject);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        cookies[key] = value;
      }
    }
  }

  static String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      String? newCookie = cookies[key];
      cookie += '$key=$newCookie';
    }

    return cookie;
  }

  bool isLoggedIn() {
    return loggedIn;
  }

  String? getCurrentUser() {
    return user;
  }
}

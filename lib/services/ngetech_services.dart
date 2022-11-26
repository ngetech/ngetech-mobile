import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class NgetechServices {
  late final http.Client _client;
  late final SharedPreferences _pref;

  final Map<String, String> _headers = {};
  Map<String, String> _cookies = {};
  Map<String, String> _jsonData = {};

  bool loggedIn = false;
  bool initialized = false;

  Future init(BuildContext context) async {
    _client = http.Client();
    if (!initialized) {
      _pref = await SharedPreferences.getInstance();
      String? savedCookies = _pref.getString("cookies");
      if (savedCookies != null) {
        _cookies = Map<String, String>.from(json.decode(savedCookies));
        if (_cookies['sessionid'] != null) {
          loggedIn = true;
          _headers['cookie'] = _generateCookieHeader();
        }
      }
    }
    initialized = true;
  }

  Future persist(String cookies) async {
    _pref.setString("cookies", cookies);
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];
        if (key == 'path' || key == 'expires') return;
        _cookies[key] = value;
      }
    }
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];
    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');
      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');
        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      _headers['cookie'] = _generateCookieHeader();
      String cookieObject = (const JsonEncoder()).convert(_cookies);
      persist(cookieObject);
    }
  }

  String _generateCookieHeader() {
    String cookie = "";
    for (var key in _cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      String? newCookie = _cookies[key];
      cookie += '$key=$newCookie';
    }

    return cookie;
  }

  Future<dynamic> login(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }

    http.Response response = await _client.post(
      Uri.parse(url),
      body: data,
      headers: _headers,
    );

    _updateCookie(response);

    if (response.statusCode == 200) {
      loggedIn = true;
      _jsonData = json.decode(response.body);
    } else {
      loggedIn = false;
    }

    return json.decode(response.body);
  }

  Map<String, String> getJsonData() {
    return _jsonData;
  }

  Future<dynamic> get(String url) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response = await _client.get(
      Uri.parse(url),
      headers: _headers,
    );
    _updateCookie(response);
    return json.decode(response.body);
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response = await _client.post(
      Uri.parse(url),
      body: data,
      headers: _headers,
    );
    _updateCookie(response);
    return json.decode(response.body);
  }

  Future<dynamic> postJson(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    _headers['Content-Type'] = 'application/json; charset=UTF-8';
    http.Response response = await _client.post(
      Uri.parse(url),
      body: data,
      headers: _headers,
    );
    _headers.remove('Content-Type');
    _updateCookie(response);
    return json.decode(response.body);
  }

  Future<dynamic> logout(String url) async {
    http.Response response = await _client.post(Uri.parse(url));

    if (response.statusCode == 200) {
      loggedIn = false;
      _jsonData = {};
    } else {
      loggedIn = true;
    }

    _cookies = {};

    return json.decode(response.body);
  }
}
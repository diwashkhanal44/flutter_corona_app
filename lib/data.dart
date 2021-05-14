import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Data extends ChangeNotifier {
  String country = 'Global';
  var confirmed = '';
  var recovered = "check connection..";
  var deaths = " ";
  List countryNames = <String>['Global'];

  Future getCountry() async {
    var url = Uri.parse('https://covid19.mathdro.id/api/countries');
    var response = await json.decode((await http.get(url)).body.toString());
    if (response.containsKey("countries")) {
      var l = response["countries"].length;
      for (var i = 0; i < l; i++) {
        countryNames.add(response["countries"][i]["name"].toString());
      }
    }
  }

  Future<void> getdata() async {
    var url;
    if (country == 'Global') {
      url = Uri.parse('https://covid19.mathdro.id/api');
    } else {
      url = Uri.parse('https://covid19.mathdro.id/api/countries/$country');
    }
    var response = await json.decode((await http.get(url)).body);
    if (response.containsKey("confirmed")) {
      confirmed = response['confirmed']['value'].toString();
      recovered = response.containsKey("recovered")
          ? response['recovered']['value'].toString()
          : "0";
      deaths = response.containsKey("deaths")
          ? response['deaths']['value'].toString()
          : "0";
      notifyListeners();
    } else {
      confirmed = '000000';
      recovered = '000000';
      deaths = '000000';
      notifyListeners();
    }
  }
}

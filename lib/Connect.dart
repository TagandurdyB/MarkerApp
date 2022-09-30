import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Public.dart';



Future<List> getDate(String api) async {
  final response = await http.get(api);
  return json.decode(response.body);
}

class Connect_api extends StatelessWidget {
  final String URL;
  final Widget Return;
  final int LIndex;
  const Connect_api({
    Key key,
    @required this.URL,
    @required this.Return,
    @required this.LIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: getDate(URL),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            switch (LIndex) {
              case 0:
                GaleryList = ss.data;
                break;
              case 1:
                CategoriesList = ss.data;
                break;
              case 2:
                InCategoriesList = ss.data;
                break;
              case 3:
                ProductsList = ss.data;
                break;
              case 4:
                NewList = ss.data;
                break;
              case 5:
                AllProducts = ss.data;
                break;
            }
            return Return;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
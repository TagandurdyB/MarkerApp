import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Connect.dart';
import '../Public.dart';
import 'inCategiri.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/*Future<List> getDate(String api) async {
  final response = await http.get(api);
  return json.decode(response.body);
}*/

class InCategories extends StatelessWidget {
  final List list;
  InCategories({@required this.list});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Wrap(
          //alignment: WrapAlignment.spaceBetween,
          spacing: screenWidth * 0.04,
          runSpacing: screenWidth * 0.04,
          children: List.generate(
            list.isEmpty ? 0 : list.length,
                (index) => InCategori(index: index,list: list,),
          ),
        ),
      ),
    );
  }
}


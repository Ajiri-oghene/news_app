
// services is to be setup before any other thing

import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsServices {

  Future<List<Map<String, dynamic>>> getNews() //any name can be given 
  // to news services
  async{
    try{
      http.Response response = await http.get( //response can be
      // anything e.g spec
        Uri.parse(
          'https://free-news.p.rapidapi.com/v1/search?q=biden',
        ),
        headers:{
        'X-RapidAPI-Host' : 'free-news.p.rapidapi.com',
          'X-RapidAPI-Key':'7fbcb088d9msh3ce824fe7ecb2cbp1731d7jsn77469f7fdd18'
        },
      );
      final data = jsonDecode(response.body)["articles"];
      print(response.body);
      final List<Map<String, dynamic>> newsList = 
           List<Map<String, dynamic>>.from(
            data.map((e) => e),
           );
           return newsList;
    } 
    
    
    catch (e){
    // '''you can use any letter for (e).
    // where e is a single element in the iterable


    //ignore: avoid_print
    print('Error is $e');
    rethrow;
  };

  
  }
}

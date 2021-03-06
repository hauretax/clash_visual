//2. Import the required packages.
import 'dart:convert';
import 'package:clash_ap/dataStruct/Card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const myClashAPIURL = 'https://testhoo.000webhostapp.com';

class StateOfPlayer {
  List<EpicCard> cards = [];
  num totalCardNeeded = 0;

  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future fetchStateOfPlayer(val) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.

    String requestURL = '$myClashAPIURL/?userid=$val';
    print(requestURL);
    //5. Make a GET request to the URL and wait for the response.
    http.Response response = await http.get(Uri.parse(requestURL));

    //6. Check that the request was successful.
    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var playerData = decodedData['cards'];

      //9. Output the lastPrice from the method.
      return playerData;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }

  void sortingCards(List<dynamic> el) {
    String type = '';
    el.forEach((element) {
      switch (element['maxLevel']) {
        case 14:
          {
            type = 'common';
          }
          break;
        case 12:
          {
            type = 'rare';
          }
          break;
        case 9:
          {
            type = 'epic';
          }
          break;
        case 6:
          {
            type = 'Legendary';
          }
          break;
        case 4:
          {
            type = 'champion';
          }
          break;
      }
      cards.add(EpicCard(
          name: element['name'],
          level: element['level'],
          count: element['count'],
          maxLvl: element['maxLevel'],
          style: type));
    });
  }

  //i want to implemente constructor her but do  error ;-; so i call it set
  Future<num> setStateOfPlayer(val) async {
    sortingCards(await fetchStateOfPlayer(val));
    cards.forEach((el) {
      totalCardNeeded += el.maxLevel;
    });
    print(totalCardNeeded);
    return totalCardNeeded;
  }

  num get playerTotalCardNeeded {
    return totalCardNeeded;
  }
}

import 'package:flutter/material.dart';
//import 'dart:io' show Platform ;
import 'package:flutter/cupertino.dart';

import '../coin_data.dart';

class Picker {
  // DropdownButton<String> andrioidpicker() {
  //   List <DropdownMenuItem<String>> curlist = [];
  //   for (String currency in currenciesList) { ////For drop down menue
  //     var newitem = DropdownMenuItem(child: Text(currency), value: currency,);
  //     // print (currenciesList[i]);
  //     curlist.add(newitem);
  //   }
  //   // return DropdownButton(
  //   //   value: currency,
  //   //   items: curlist,
  //   //   onChanged: (value) {
  //   //     ////for drop down menue;
  //   //     currency = value;
  //   //     print(currency);
  //   //   },
  //   // );
  // } //////////////////////////////////////DropdownButton
  List<Text> iospickercountry() {
    List<Text> curlist = [];
    for (String currency in currenciesList) {
      curlist.add(Text(currency));
    }
    return curlist;
  }
  List<Text> iospickercrypto() {
    List<Text> curlist = [];
    for (String currency in cryptoList) {
      curlist.add(Text(currency));
    }
    return curlist;
  }
}
//   Widget getpcker () {
//     if (Platform.isIOS) {
//       return iospickercountry();
//     }
//     else if (Platform.isAndroid) {
//       return andrioidpicker();
//     }
//   }
// }
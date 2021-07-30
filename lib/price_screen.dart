import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'coin_data.dart';
import 'picker/picker.dart';
const url = 'https://rest.coinapi.io/v1/exchangerate';
//const apikey = 'BC604A9A-AA33-49DF-B9FC-8815432A602B';
//const apikey = 'C4BFB284-2A5C-4FE6-AEB4-AA0A3946E540';
//const apikey = 'CE2F921A-241B-4464-BD61-229EE28940BA';
//const apikey = 'FC59BA5D-2CA3-42F3-847E-A5EFBCB7082C';
// const apikey = '7E5E78D4-F643-412B-981F-CFA50212F896';
const apikey = 'D4B80007-CA0C-4854-B083-BA11C286C3B4';
//const apikey = 'F697F7B7-D29A-4BE2-93F2-92C08F08ECD4';
Picker picker = Picker();

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var currency = 'INR';
  var crypto = 'BTC';
  var price;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currency = 'INR';
    crypto = 'BTC';
    getdata(crypto, currency);
    // price = 100;
  }

  Future getdata(String crypto, String currency) async {
    http.Response response = await http.get(
      Uri.parse('$url/$crypto/$currency?apikey=$apikey'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      double c = data['rate'];
      //int cp = c.toInt();
      updateui(c);
    } else {
      print(response.statusCode);
      updateui(00);
    }
  }

  void updateui(double c) {
    setState(() {
      price = (c * 10000).round() / 10000.0;
      print(c);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Crypton Crypto Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Center(
                  child: Text(
                    '1 $crypto = $price $currency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.network(
                'https://cryptoicon-api.vercel.app/api/icon/${crypto.toLowerCase()}',
            ),
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  height: 150.0,
                  //alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: CupertinoPicker(
                    itemExtent: 30,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        print(cryptoList[index]);
                        crypto = cryptoList[index];
                        getdata(crypto, currency);
                      });
                    },
                    children: picker.iospickercrypto(),
                  ), //getpcker(),
                ),
              ),
              Expanded(
                child: Container(
                  height: 150.0,
                  //width: 32.0,
                  //alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: CupertinoPicker(
                    itemExtent: 30,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        print(currenciesList[index]);
                        currency = currenciesList[index];
                        getdata(crypto, currency);
                      });
                    },
                    children: picker.iospickercountry(),
                  ), //getpcker(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

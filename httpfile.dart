import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class httpfile extends StatefulWidget {
  const httpfile({super.key});

  @override
  State<httpfile> createState() => _httpfileState();
}

class _httpfileState extends State<httpfile> {
  bool downloading = false;
  bool gotData =false;
  var data;
  Future <bool> downLoadData() async{
    var response;
    try{
      var url= Uri.parse('https://dummyjson.com/products/1');
      response= await http.get(url);
    }catch(a){
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    data=jsonDecode(response.body);
    print('json Decode${data}');
    print('title=${data['title']}');
    setState(() {

    });
    return true;
  }
  Future <bool> post() async {
    var response;
    var data = {"title": 'iam sneha', 'userId': '2'};
    try {
      var url = Uri.parse('https://dummyjson.com/posts/add');
      response = await http.post(url, body: data);
    } catch (a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }
  Future <dynamic> put() async {
    var response;
    var data = {"title": "I think I should shift to the moon",};
    try {
      var url = Uri.parse('https://dummyjson.com/posts/1');
      response = await http.put(url, body: data);
    } catch (a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }
  Future <dynamic> delete() async {
    var response;
    // var data = {"title": "I think I should shift to the moon",};
    try {
      var url = Uri.parse('https://dummyjson.com/posts/1');
      response = await http.delete(url);
    } catch (a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:Column(
        children: [
         downloading? Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
              margin: EdgeInsets.only(top:5),
              child:gotData? Column(
                children: [
                  Text("Item = ${data['title']}",style: TextStyle(fontSize: 20),),
                  Text("id = ${data['id']}",style: TextStyle(fontSize: 20),),
                  Text("Category = ${data['category']}",style: TextStyle(fontSize: 20),),
                  Text("price = ${data['price']}",style: TextStyle(fontSize: 20),),
                  Text("Brand = ${data['brand']}",style: TextStyle(fontSize: 20),),
                ],
              )
                  : Center(
                child: SizedBox(
                  width:100,
                  height:100,
                  child:CircularProgressIndicator(),
                ),
              )
          ):
           Container(
             width: MediaQuery.of(context).size.width,
             height: 400,
             margin: EdgeInsets.only(top: 210),
             color: Colors.blueAccent,
             child: Column(
               children: [
                 ElevatedButton(
                     onPressed: () async{
                       setState(() {
                         downloading = true;
                       });
                       gotData= await downLoadData();
                 },
                     child: Text('GET')),
                 SizedBox(
                   height: 10,
                 ),
                 ElevatedButton(
                   onPressed: ()async {
                     await post();
                   },
                   child: Text('POST')),
                 SizedBox(
                   height: 10,
                 ),
                 ElevatedButton(
                     onPressed:() {
                       put();
                     },
                     child: Text('PUT')),
                 SizedBox(
                   height: 10,
                 ),
                 ElevatedButton(
                     onPressed: () {
                       delete();
                     },
                     child: Text('DELETE'))
               ],
             ),
           )
        ],
      ),
    );
  }
}

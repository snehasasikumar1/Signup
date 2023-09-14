import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class backendfile extends StatefulWidget {
  const backendfile({super.key});

  @override
  State<backendfile> createState() => _backendfileState();
}

class _backendfileState extends State<backendfile> {
  var gotData= false;
  var data;
  bool downLoading= false;

  Future<bool>downLoadData() async{
    var response;
    try{
      var url=Uri.parse('https://dummyjson.com/products/1');
      response=await http.get(url);
      } catch(a){
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
  Future<bool> post() async{
    var response;
    var data = {"title": 'shaniba', 'userId': '5'};
    try{
      var url=Uri.parse('https://dummyjson.com/post/add');
      response=await http.post(url, body:data);
    } catch(a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }
  Future<dynamic> put() async{
    var response;
    var data = {"title": 'change to shinu'};
    try{
      var url=Uri.parse('https://dummyjson.com/product/1');
      response=await http.put(url, body:data);
    } catch(a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }
  Future<dynamic> delete() async{
    var response;
    try{
      var url=Uri.parse('https://dummyjson.com/post/1');
      response=await http.delete(url, body:data);
    } catch(a) {
      print('Error=$a');
      return false;
    }
    print('Data status code=${response.statusCode}');
    print('data=${response.body}');
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          downLoading? Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            color: Colors.black26,
            margin: EdgeInsets.only(top: 4),
            child: gotData? Column(
              children: [
                Text("Item = ${data['title']}",style: TextStyle(fontSize: 15),),
                Text("id =${data['id']}",style: TextStyle(fontSize: 15),),
                Text("category =${data['category']}",style: TextStyle(fontSize: 15),),
                Text("price =${data['price']}",style: TextStyle(fontSize: 15),),
                Text("Brand =${data['brand']}",style: TextStyle(fontSize: 15),)
              ],
            )
                :Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            )
          ):
          Container(
            width: MediaQuery.of(context).size.height,
            height: 400,
            color: Colors.greenAccent,
            margin: EdgeInsets.only(top: 210),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async{
                      setState(() {
                        downLoading=true;
                      });
                      gotData=await downLoadData();
                    },
                    child: Text('GET')),
                SizedBox(
                  height: 3,
                ),
                ElevatedButton(
                    onPressed: () async{
                      await post();
                    }, child: Text('POST') ),
                SizedBox(
                  height: 3,
                ),
                ElevatedButton(
                    onPressed: () {
                      put();
                    }, child: Text('PUT')),
                SizedBox(
                  height: 3,
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic data;
  bool isLoading = true;
  Future<void> getInformation() async{
    isLoading = true;
    setState(() {});
    final url = 
        Uri.parse("http://universities.hipolabs.com/search?country=Uzbekistan");
    final res = await http.get(url);
    data = jsonDecode(res.body);
    isLoading = false;
    setState(() {});
  }

  void initState(){
    getInformation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("UNVERSITES"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: data.length,
          itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: Colors.lightBlue),
            child: Column(
              children: [
                Text(data[index]["name"],
                maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20,),
                TextButton(onPressed: () async {
                  final launchUri = Uri.parse(data[index]["web_pages"]?[0] ?? "");
                  await url_launcher.launchUrl(launchUri);
                  }, child: Text(
                    data[index]["web_pages"]?[0] ?? "",
                  style: TextStyle(color: Colors.white),
                )),
                SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () async {
                  final Uri launchUri = Uri(scheme: 'tel', path: '+998996722090');
                  await url_launcher.launchUrl(launchUri);
                }, child: Text(
                  "number",
                  style: TextStyle(color: Colors.white),
                )),
                TextButton(onPressed: () async {
                  final Uri launchUri = Uri(scheme: 'sms', path: '+998996722090');
                  await url_launcher.launchUrl(launchUri);
                }, child: Text(
                  "sms",
                  style: TextStyle(color: Colors.white),
                )),

              ],
            ),
          );
      }),
    );
  }
}

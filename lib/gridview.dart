import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject/detailscreen.dart';
import 'package:miniproject/response.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {

  Response? responseValue;
  bool haveResponse = false;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

void getValue() async {
    try {
      var request = http.Request(
        'GET',
        Uri.parse(
          'http://qas-wsappwf.homepro.local/ws_FitTile/ws_FitTileService.asmx/getFitTile_Default2?company=hp&from=0&size=8',
        ),
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonString = await response.stream.bytesToString();
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        responseValue = Response.fromJson(jsonMap);
        setState(() {
          haveResponse = true;
        });
        // responseValue = ResponseValue.fromJson(jsonMap);
        // haveRes = true;
        // setState(() {});
        // debugPrint(responseValue?.list?[1].id);
        print(responseValue!.artDetail![0].image);
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "Alert",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(
              "${response.statusCode}  ${response.reasonPhrase}",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("ปิด"),
              ),
            ],
          ),
        );
      }
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      print(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Alert",
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            e.toString(),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("ปิด"),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    print(haveResponse);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: haveResponse ? gridview(context): const Center(child: CircularProgressIndicator(),)
        
        
          ),
      );
  }

  GridView gridview(BuildContext context){
    return GridView.count(

          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            responseValue!.artDetail?.length ?? 0
            , (index) => InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailScreen(responseValue: responseValue!.artDetail![index])));
              },
              child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration:  BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(responseValue!.artDetail![index].image ?? ""),
                      )
                      ),
                      Expanded(
                      flex: 2,
                      child: Container(
                         decoration:  const BoxDecoration(
                          color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        child:Center(child: Text(responseValue!.artDetail![index].id ?? ""),)
                      )
                      )
                  ],
                ),
                ),
            ),
          ));
          
  } 
}
import 'dart:convert';

import 'package:covid_tracker/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: "COVID-19 Tracker",
        initialRoute: "/",
        
        routes: {
          "/": (context) => SplashScree(),
          "/covid": (context) => CovidApp(),
          "/home":(context)=> HomePage(),
          

        }),
  );
}

class CovidApp extends StatefulWidget {
  CovidApp({Key key}) : super(key: key);

  @override
  _CovidAppState createState() => _CovidAppState();
}

class _CovidAppState extends State<CovidApp> {
  bool loading = true;
  List lsCountry;

  Future <String> _getWorldData() async {
    var response = await http.get('https://brp.com.np/covid/country.php');
    var getData = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        loading = false;
        lsCountry = [getData];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
      _getWorldData();
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blueAccent[400]);
    return Scaffold(
      appBar: AppBar(
         
        backgroundColor: Colors.blueAccent[400],
        title: Text(
          "Regional Statistics",
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _getWorldData();
              })
        ],
      ),
      body: ListView(
        
        padding: EdgeInsets.all(5),
        children: [
          
          loading
              ?Center(child: CircularProgressIndicator())
              : ListView.builder(
                
                  itemBuilder: (context, i) {
                    return listItems(i);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lsCountry == null
                      ? 0
                      : lsCountry[0]["countries_stat"].length,
                  
                )
        ],
      ),
    );
  }

  Widget listItems(int i) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(lsCountry[0]["countries_stat"][i]["country_name"],
              style:
                  GoogleFonts.actor(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                            color: Colors.purple,
                         
                      
                            gradient: new LinearGradient(
                              colors: [
                                Colors.red[200],
                                Colors.red,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(lsCountry[0]["countries_stat"][i]["cases"],
                            style: GoogleFonts.pacifico(fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Text("Total Cases")
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                            color: Colors.purple,
                            
                     
                            gradient: new LinearGradient(
                              colors: [
                                Colors.green[200],
                                Colors.greenAccent[700]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                            lsCountry[0]["countries_stat"][i]
                                ["total_recovered"],
                            style: GoogleFonts.pacifico(fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Text("Recovered")
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                       
                            color: Colors.purple,
                            gradient: new LinearGradient(
                              colors: [
                                Colors.grey[350],
                                Colors.grey[700]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(lsCountry[0]["countries_stat"][i]["deaths"],
                            style: GoogleFonts.pacifico(fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Text("Deaths")
                      ],
                    )),
              ),
            ],
          
        ),
        Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                     decoration: new BoxDecoration(
                            color: Colors.purple,
                            
                            gradient: new LinearGradient(
                              colors: [
                                Colors.red[100],
                                Colors.redAccent[100],
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(lsCountry[0]["countries_stat"][i]["active_cases"],
                            style: GoogleFonts.pacifico(fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Text("Active Cases")
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                    decoration: new BoxDecoration(
                          
                            color: Colors.purple,
                            gradient: new LinearGradient(
                              colors: [
                                Colors.grey[350],
                                Colors.grey[700]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(lsCountry[0]["countries_stat"][i]["new_deaths"],
                            style: GoogleFonts.pacifico(fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        ),
                        Text("New Deaths")
                      ],
                    )),
              ),
            ],
          ),
        
      ],
    );
  }
}

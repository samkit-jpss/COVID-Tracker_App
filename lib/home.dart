import 'dart:convert';

import 'package:covid_tracker/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List lsCountry;
  var getData;
  Future<String> globalData() async {
    var response = await http.get('https://corona.lmao.ninja/v2/all');
 if (this.mounted) {
    setState(() {
       getData = json.decode(response.body);
    
    });
  }
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      globalData();
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blueAccent[400]);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications_none),
          SizedBox(width: 8),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                globalData();
              })
        ],
        backgroundColor: Colors.blueAccent[400],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
                height: 205,
                decoration: new BoxDecoration(
                    color: Colors.blueAccent[400],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent[400],
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)))),
            Column(children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 270, 15),
                child: Text(
                  "COVID-19",
                  style: GoogleFonts.capriola(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 160),
                child: Text(
                  "Are you feeling sick?",
                  style: GoogleFonts.aBeeZee(fontSize: 24, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "If you feel sick with any COVID-10 symptons, please call or text us immediately for help",
                  style: GoogleFonts.capriola(
                      fontSize: 15, color: Colors.blue[100]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Call Now",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      onPressed: () =>
                          Utils.openPhoneCall(phoneNumber: '011-23978046'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.orange[400],
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Send Email",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      onPressed: () => Utils.openEmail(
                          toEmail: 'wrindia@who.int',
                          subject: 'COVID-19',
                          body:
                              "Hello,\nI'm writing this message to let you know that I've tested positive ..."),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.greenAccent[400],
                      child: Row(
                        children: [
                          Icon(
                            Icons.mode_comment,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Send SMS",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      onPressed: () =>
                          Utils.openSMS(phoneNumber: '011-23978046'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Worldwide",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    
                    ),
                  ),
                ],
              ),
              Container(
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 80,
                        decoration: new BoxDecoration(
                            color: Colors.purple,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                            gradient: new LinearGradient(
                              colors: [
                                Colors.red[100],
                                Colors.redAccent[100],
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Text(
                              "Total Cases",
                              style: GoogleFonts.pacifico(color: Colors.red[900])
                            ),
                            Text(getData['cases'].toString() ?? "...", style: TextStyle(color: Colors.red[900])
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 80,
                        decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent[400],
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                            color: Colors.purple,
                            gradient: new LinearGradient(
                              colors: [
                                Colors.blue[100],
                                Colors.blueAccent[100]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Text("Active Cases", style: GoogleFonts.pacifico(color: Colors.blue[900])),
                             Text(getData['active'].toString() ?? "...",style: TextStyle(color: Colors.blue[900])
                            ),
                          ],
                        )),
                    Container(
                        height: 80,
                        decoration: new BoxDecoration(
                            color: Colors.purple,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green,
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                            gradient: new LinearGradient(
                              colors: [
                                Colors.green[100],
                                Colors.greenAccent[100]
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Text("Recoveries", style: GoogleFonts.pacifico(color: Colors.green[900])),
                            Text(getData['recovered'].toString() ?? "...",style: TextStyle(color: Colors.green[900])
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        margin: EdgeInsets.all(10),
                        height: 80,
                        decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[700],
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                            color: Colors.purple,
                            gradient: new LinearGradient(
                              colors: [Colors.grey[350], Colors.grey[400]],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Text("Deaths", style: GoogleFonts.pacifico()),
                            Text(getData['deaths'].toString() ?? "...",
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Prevention Tips",
                          style: GoogleFonts.lato(
                            fontSize: 20,

                          ),
                        ),
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/hand.png', width: 130),
                            Image.asset(
                              'images/distance.png',
                              width: 140,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "More Info",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    Utils.openLink(
                        url:
                            'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-coronaviruses');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: new BoxDecoration(
                        color: Colors.purple,
                        gradient: new LinearGradient(
                          colors: [Colors.blue[100], Colors.blueAccent[400]],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("images/doctor.png"),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Need to know more about COVID-19?",
                                  style: GoogleFonts.capriola(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(
                                "Official Public Service Announcement\n on Coronavirus from the World Health\n Organization. Learn about Symptoms,\n Prevention, Travel Advisory and\n Common FAQs on Coronavirus.",
                                style: GoogleFonts.capriola(
                                    color: Colors.white, fontSize: 10.9),
                                maxLines: 5,
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/covid");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  padding: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: new BoxDecoration(
                      color: Colors.purple,
                      gradient: new LinearGradient(
                        colors: [Colors.greenAccent[100], Colors.blueAccent[400]],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("images/earth.png"),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Countries where COVID-19 has spread!",
                                style: GoogleFonts.capriola(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(
                              "List of all the countries data having Total\nnumber of coronavirus cases,Deaths,\n Recoveries and more.",
                              style: GoogleFonts.capriola(
                                  color: Colors.white, fontSize: 10.9),
                              maxLines: 5,
                            ),
                          ])
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ]),
          ],
        ),
      ),
    );
  }

  canLaunch(command) {}
}

class SplashScree extends StatefulWidget {
  SplashScree({Key key}) : super(key: key);

  @override
  _SplashScreeState createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScree> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text('COVID-19 Tracker',
          style: GoogleFonts.pacifico(fontSize: 25)),
      seconds: 2,
      image: new Image.asset('images/splash.gif'),
      backgroundColor: Colors.white,
      navigateAfterSeconds: HomePage(),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 160.0,
      loaderColor: Colors.blue.shade900,
      loadingText: Text("Be Safe, Take care of your family",
          style: GoogleFonts.pacifico(color: Colors.blue[900])),
    );
  }
}

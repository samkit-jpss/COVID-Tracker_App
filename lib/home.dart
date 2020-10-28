import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[700]);
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("COVID-19 Tracker" , style: GoogleFonts.pacifico(),),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue[700],
          child: Text("Show List" , style: GoogleFonts.pacifico(color: Colors.white),),
          onPressed: () => Navigator.pushNamed(context, "/covid"),
        ),
      ),
    );
  }
}

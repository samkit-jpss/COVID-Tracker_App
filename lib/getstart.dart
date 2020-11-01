import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Animation/FadeAnimation.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeAnimation(1,Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/home.png"),
            SizedBox(height: 5),
            Text(
              "Coronavirus (COVID-19)",
              style:
                  GoogleFonts.capriola(fontSize: 27, color: Colors.blue[700]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: Text(
                "are a large family of viruses which may cause illness in animals or humans. ",
                style:
                    GoogleFonts.capriola(fontSize: 15, color: Colors.blue[200]),
              ),
            ),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              shape: RoundedRectangleBorder(
              
                borderRadius: new BorderRadius.circular(18.0),
              
                side: BorderSide(color: Colors.blue),
              ),
              color: Colors.white,
              elevation: 5,
              child: Text(
                "Get Started",
                style: GoogleFonts.capriola(color: Colors.blue[800], fontSize: 20),
              ),
            )
          ],
        )),
      ),)
    );
  }
}

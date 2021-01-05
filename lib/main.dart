import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapplicacs/components/LoginForm.dart';
import 'Pages/HomePage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Lavi',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)),
      home: Container(
        // If not authenticated
        child: WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [HexColor('#4A00E0'), HexColor('#250070')])),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 52.0, bottom: 52.0, left: 40.0, right: 40.0),
              child: SizedBox.expand(
                child: Column(
                    // logo
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text('RemoteEpsilon',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18))),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          "assets/main_illustration.svg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Rediscover ',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  Text('remote learning.',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ]),
                            Expanded(
                                child: Text(
                              'We at remote epsilon try to make the remote learning expirience just as fun as being in class.',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ))
                          ],
                        ),
                        flex: 1,
                      ),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 60.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Scaffold(
                                      body: Padding(
                                        padding: const EdgeInsets.all(52.0),
                                        child: Center(child: LoginForm()),
                                      ),
                                      appBar: AppBar(
                                        title: Text('Login'),
                                      ),
                                    )));
                          },
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Get started',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: HexColor('#4A00E0'),
                                          borderRadius:
                                              BorderRadius.circular(90000)))
                                ],
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                      )
                    ]),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const fontColor = Color.fromARGB(255, 216, 184, 214);
  static const shadowColor = Color.fromARGB(255, 252, 92, 244);
  static const backGroudnColor = Color.fromARGB(255, 28, 4, 44);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: backGroudnColor,
            elevation: 20,
            shadowColor: shadowColor,
            automaticallyImplyLeading: false,
            title: Text(
              'HIGH LOW',
              style: TextStyle(
                  fontFamily: 'Audiowide',
                  fontSize: 35,
                  color: fontColor,
                  letterSpacing: 5),
            )),
        body: Stack(children: [
          Center(
            child: Container(
              height: 700,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/background/backgroundimage2.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              top: 440,
              left: 150,
              child: MaterialButton(
                height: 50,
                minWidth: 100,
                color: backGroudnColor,
                elevation: 12,
                hoverElevation: 5,
                highlightElevation: 5,
                child: Text('START',
                    style: TextStyle(
                        fontFamily: 'Audiowide',
                        fontSize: 15,
                        color: fontColor)),
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteManager.secondPage),
              )),
        ]));
  }
}

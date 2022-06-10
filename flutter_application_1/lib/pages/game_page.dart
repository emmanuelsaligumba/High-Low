import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/appdata.dart';
import 'package:flutter_application_2/routes/routes.dart';
import 'package:provider/provider.dart';

import '../models/button_fuctions.dart';
import '../models/draw.dart';

class SecondPage extends StatefulWidget {
  int index1;
  int index2;
  SecondPage({required this.index1, required this.index2});
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static const fontColor = Color.fromARGB(255, 216, 184, 214);
  static const shadowColor = Color.fromARGB(255, 252, 92, 244);
  static const backGroudnColor = Color.fromARGB(255, 28, 4, 44);
  static const buttonColor = Color.fromARGB(255, 196, 38, 224);
  Duration displayTime = Duration(seconds: 1);
  bool buttonState = true;
  @override
  Widget build(BuildContext context) {
    int score = 0;
    String backCard = 'assets/cards/backcard.jpg';
    String currentCard = DrawCard.imageCard(widget.index2);
    String statement = '';
    print('${DrawCard.value(widget.index1)} ${DrawCard.value(widget.index2)}');
    int result = 0;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'HIGH LOW',
            style: TextStyle(
                fontFamily: 'Audiowide',
                fontSize: 35,
                color: fontColor,
                letterSpacing: 5),
          ),
          centerTitle: true,
          backgroundColor: backGroudnColor,
          elevation: 20,
          shadowColor: shadowColor,
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                height: 700,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/background/backgroundimage.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                top: 420,
                left: 103,
                child: Container(
                    height: 400,
                    width: 400,
                    child: Consumer<GameData>(builder: (context, value, child) {
                      return Text(
                        statement = context.watch<GameData>().outCome,
                        style: TextStyle(
                            fontFamily: 'Audiowide',
                            fontSize: 30,
                            color: fontColor),
                      );
                    }))),
            Positioned(
              top: 100,
              left: 30,
              child: Container(
                  height: 200,
                  width: 130,
                  child: Card(
                    shadowColor: shadowColor,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 10,
                    child: Consumer(
                      builder: (context, value, child) {
                        return Image(
                            image: AssetImage(
                                backCard = context.watch<GameData>().cardFlip));
                      },
                    ),
                  )),
            ),
            Positioned(
              top: 100,
              left: 233,
              child: Container(
                  height: 200,
                  width: 130,
                  child: Card(
                    shadowColor: shadowColor,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 10,
                    child: Consumer(
                      builder: (context, value, child) {
                        return Image(image: AssetImage(currentCard));
                      },
                    ),
                  )),
            ),
            Positioned(
                top: 520,
                left: 53,
                child: MaterialButton(
                  onPressed: buttonState
                      ? () {
                          setState(() {
                            buttonState = false;
                          });
                          result = InGame.valueCompareGreater(
                              DrawCard.value(widget.index1),
                              DrawCard.value(widget.index2));
                          context.read<GameData>().outComeState = result;
                          context.read<GameData>().flipCard = widget.index1;
                          if (result == 0) {
                            Future.delayed(displayTime, () {
                              context.read<GameData>().outComeState = 2;
                              Future.delayed(
                                  displayTime,
                                  () => Navigator.of(context)
                                      .pushNamed(RouteManager.homePage));
                            });
                          } else {
                            Future.delayed(displayTime, () {
                              context.read<GameData>().outComeState = 2;
                              context.read<GameData>().toBackCard =
                                  'assets/cards/backcard.jpg';
                              Navigator.of(context)
                                  .pushNamed(RouteManager.secondPage);
                            });
                          }
                        }
                      : null,
                  color: buttonColor,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  disabledColor: buttonColor,
                  child: Text(
                    '>',
                    style: TextStyle(
                        fontFamily: 'Audiowide',
                        fontSize: 30,
                        color: fontColor),
                  ),
                )),
            Positioned(
                top: 520,
                left: 153,
                child: MaterialButton(
                  onPressed: buttonState
                      ? () {
                          setState(() {
                            buttonState = false;
                          });
                          result = InGame.valueCompareEqual(
                              DrawCard.value(widget.index1),
                              DrawCard.value(widget.index2));
                          context.read<GameData>().outComeState = result;
                          context.read<GameData>().flipCard = widget.index1;
                          if (result == 0) {
                            Future.delayed(displayTime, () {
                              context.read<GameData>().outComeState = 2;
                              Future.delayed(
                                  displayTime,
                                  () => Navigator.of(context)
                                      .pushNamed(RouteManager.homePage));
                            });
                          } else {
                            context.read<GameData>().outComeState = 2;
                            Future.delayed(displayTime, () {
                              context.read<GameData>().toBackCard =
                                  'assets/cards/backcard.jpg';
                              Navigator.of(context)
                                  .pushNamed(RouteManager.secondPage);
                            });
                          }
                        }
                      : null,
                  color: buttonColor,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  disabledColor: buttonColor,
                  child: Text(
                    '=',
                    style: TextStyle(
                        fontFamily: 'Audiowide',
                        fontSize: 30,
                        color: fontColor),
                  ),
                )),
            Positioned(
              top: 520,
              left: 253,
              child: MaterialButton(
                onPressed: buttonState
                    ? () {
                        setState(() {
                          buttonState = false;
                        });
                        result = InGame.valueCompareLess(
                            DrawCard.value(widget.index1),
                            DrawCard.value(widget.index2));
                        context.read<GameData>().outComeState = result;
                        context.read<GameData>().flipCard = widget.index1;
                        if (result == 0) {
                          Future.delayed(displayTime, () {
                            context.read<GameData>().outComeState = 2;
                            Future.delayed(
                                displayTime,
                                () => Navigator.of(context)
                                    .pushNamed(RouteManager.homePage));
                          });
                        } else {
                          context.read<GameData>().outComeState = 2;
                          Future.delayed(displayTime, () {
                            context.read<GameData>().toBackCard =
                                'assets/cards/backcard.jpg';
                            Navigator.of(context)
                                .pushNamed(RouteManager.secondPage);
                          });
                        }
                      }
                    : null,
                color: buttonColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                disabledColor: buttonColor,
                child: Text(
                  '<',
                  style: TextStyle(
                      fontFamily: 'Audiowide', fontSize: 30, color: fontColor),
                ),
              ),
            )
          ],
        ));
  }
}

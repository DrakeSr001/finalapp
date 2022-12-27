import 'package:finalapp/Screens/Login/login.dart';
import 'package:finalapp/Screens/Register/register.dart';
import 'package:finalapp/home/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'mainBackground.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // this size provides us total height and widht of our screen
    return Background(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Welcome to ShopIt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Grotesco',
            color: Colors.teal[600],
            fontSize: 27,
          ),
        ),
        SvgPicture.asset(
          'assets/images/welcome.svg',
          height: size.height * 0.4,
        ),

        // Login Button
        Container(
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ));
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: 'Grotesco',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // style: ButtonStyle(
              //   foregroundColor: MaterialStateProperty.all(Colors.white),
              //   backgroundColor: MaterialStateProperty.all(Colors.purple[800]),
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //           borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(1),
              //               topRight: Radius.circular(20)),
              //           side: BorderSide(
              //               color: Colors.green,
              //               strokeAlign: StrokeAlign.inside))),
              // )),
            )),

        // Register button
        Container(
            margin: EdgeInsets.all(10),
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 156, 47, 175),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => register(),
                    ));
              },
              child: Text(
                "Register",
                style: TextStyle(
                    fontFamily: 'Grotesco',
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // style: ButtonStyle(
              //   foregroundColor: MaterialStateProperty.all(Colors.white),
              //   backgroundColor: MaterialStateProperty.all(Colors.purple[800]),
              //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //           borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(1),
              //               topRight: Radius.circular(20)),
              //           side: BorderSide(
              //               color: Colors.green,
              //               strokeAlign: StrokeAlign.inside))),
              // )),
            )),

        Container(
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homepage(),
                      ));
                },
                child: Text(
                  'Skip to homepage ->',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )))
      ]),
    );
  }
}

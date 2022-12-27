import 'package:finalapp/Screens/Login/loginbody.dart';
import 'package:finalapp/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class registersuccess extends StatefulWidget {
  const registersuccess({super.key});

  @override
  State<registersuccess> createState() => _registersuccessState();
}

class _registersuccessState extends State<registersuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 150),
            child: Text(
              'Registeration Successfull',
              style: TextStyle(fontSize: 25, color: Colors.purple[800]),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/images/logsuc.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          Container(
            margin: EdgeInsets.all(80),
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 132, 36, 145),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginsta(),
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
            ),
          ),
        ],
      )),
    );
  }
}

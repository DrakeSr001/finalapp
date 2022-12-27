import 'package:finalapp/Components/mainBackground.dart';
import 'package:finalapp/Screens/Login/components/loginground.dart';
import 'package:finalapp/Screens/Login/loginsuccess.dart';
import 'package:finalapp/Screens/Register/components/registerGround.dart';
import 'package:finalapp/config.dart';
import 'package:finalapp/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/Screens/Login/components/loginGround.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class loginsta extends StatefulWidget {
  const loginsta({super.key});

  @override
  State<loginsta> createState() => _loginstaState();
}

class _loginstaState extends State<loginsta> {
  bool isPassword = false;
  Icon icon = Icon(Icons.visibility_off);
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/main_top.png',
            width: size.width * 0.3,
          ),
        ),
        Container(
          child: Text(
            'Login',
            style: TextStyle(
                fontFamily: 'Grotesco',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800]),
          ),
        ),
        SvgPicture.asset(
          'assets/images/loginpic.svg',
          height: size.height * 0.45,
        ),
        //Email
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 15, color: Colors.purple),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple)),
              suffixIcon: Icon(
                Icons.email,
              ),
              label: Text("E-mail"),
            ),
          ),
        ),

        //Password
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 15, color: Colors.purple),
              obscureText: !isPassword,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: isPassword
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ),

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
              login(emailController.text, passController.text);
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginsuccess(),
                    ));
              } else {
                print(Text("Error"));
              }
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

        Container(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/images/login_bottom.png',
            width: size.width * 0.4,
          ),
        ),
      ]),
    )));
  }
}

Future login(String email, String pass) async {
  var url = Uri.parse(
      "${APIConfig.BASEURL}userRegister.php?email=$email&password=$pass");
  var response = await http.get(url);
  print(response.body);
}

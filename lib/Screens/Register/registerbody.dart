import 'dart:convert';

import 'package:finalapp/Screens/Login/loginbody.dart';
import 'package:finalapp/Screens/Register/registersucess.dart';
import 'package:finalapp/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:finalapp/models/User.dart';

class registersta extends StatefulWidget {
  const registersta({super.key});

  @override
  State<registersta> createState() => _registerstaState();
}

class _registerstaState extends State<registersta> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isPassword = false;
  Icon icon = Icon(Icons.visibility_off);
  final _formKey = GlobalKey<FormState>();

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
                'Register',
                style: TextStyle(
                    fontFamily: 'Grotesco',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[800]),
              ),
            ),

            // First name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 15, color: Colors.purple),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                  label: Text("First Name"),
                ),
              ),
            ),

            // Last name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 15, color: Colors.purple),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                  label: Text("Last Name"),
                ),
              ),
            ),

            // UserName
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 15, color: Colors.purple),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: Icon(
                    Icons.person_outline,
                  ),
                  label: Text("User Name"),
                ),
              ),
            ),

            //Email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                  ),
                ),
              ),
            ),

            // phone
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 15, color: Colors.purple),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: Icon(
                    Icons.phone,
                  ),
                  label: Text("Phone Number"),
                ),
              ),
            ),

            // address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: addressController,
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 15, color: Colors.purple),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: Icon(
                    Icons.location_on,
                  ),
                  label: Text("Address"),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              width: size.width * 0.6,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 27, 0, 100),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: TextButton(
                onPressed: () {
                  registerNewUser(
                      firstNameController.text,
                      lastNameController.text,
                      userNameController.text,
                      emailController.text,
                      passController.text,
                      phoneController.text,
                      addressController.text);
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => loginsta(),
                        ));
                  } else {
                    print(Text("Error"));
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: 'Grotesco',
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Bottom png
            Container(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * 0.2,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

User? userModelObject;
Future registerNewUser(String fname, String lname, String username,
    String email, String pass, String phone, String address) async {
  var url = Uri.parse(
      "${APIConfig.BASEURL}userRegister.php?first_name=$fname&last_name=$lname&user_name=$username&user_email=$email&user_password=$pass&user_phone=$phone&address=$address");
  var response = await http.get(url);
  userModelObject = User.fromJson(jsonDecode(response.body));
  if (userModelObject!.message == "User Registered Successfully") {
    //Navigate to home
  }
  print(userModelObject);
}

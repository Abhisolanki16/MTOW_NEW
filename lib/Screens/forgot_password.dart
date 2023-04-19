import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgot_email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 120),
            alignment: Alignment.center,
            child: Icon(
              Icons.lock,
              size: 100,
              color: Colors.deepOrange.shade600,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            alignment: Alignment.topLeft,
            child: Text(
              "Forgot Password ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            alignment: Alignment.topLeft,
            child: Text(
              "Provide your email and we will send you a link to reset your password.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.topLeft,
              child: TextField(
                  controller: forgot_email,
                  decoration: InputDecoration(
                      labelText: "Enter your email",
                      labelStyle:
                          TextStyle(fontSize: 18, color: Colors.deepOrange),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      )))),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 250,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Reset password",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            //height: 60,
            //width: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20)),
      
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]),
      ),
    );
  }
}

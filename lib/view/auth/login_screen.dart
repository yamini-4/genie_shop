import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genie/constants/colors.dart';
import 'package:genie/view/auth/signup_screen.dart';

import '../../constants/constants.dart';
import '../home/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _email, _password;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode node = FocusNode(); //jumps to next field
  void signIn() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email!, password: _password!)
        .catchError(
      (onError) {
        FirebaseAuthException exception = onError as FirebaseAuthException;

        final snackBar = SnackBar(
          content: Text(
            exception.message ?? 'Invalid email / password',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: primaryColor,
          duration: Duration(
            seconds: 3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(onError);
      },
    ).then(
      (authuser) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

// void doLogin(BuildContext context) {
//   if (_email == "user@gmail.com" && _password == "123456") {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HomePage(),
//       ),
//     );
//   } else {
//     final snackBar = SnackBar(
//       content: const Text(
//         'Invalid username/password ',
//         style: TextStyle(fontSize: 17),
//       ),
//       action: SnackBarAction(
//         label: 'Okay',
//         textColor: Colors.white,
//         onPressed: () {
//           // Some code to undo the change.
//         },
//       ),
//     );

//     // Find the ScaffoldMessenger in the widget tree
//     // and use it to show a SnackBar.
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; //gets the hyt of device
    double width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    height: height.h * 0.42,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    // color: Colors.brown.withOpacity(0.5),
                    alignment: Alignment.bottomCenter,
                    height: height.h * 0.50,
                    width: width,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text: "$appName\n",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: slogan,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                    ),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     stops: [0.4, 0.85], //start and stop of gradient color
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //     colors: [Colors.transparent, Colors.white],
                    //   ),
                    // ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13.0,
                        vertical: 11,
                      ),
                      child: Container(
                        child: Text(
                          " $login",
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                          border: Border(
                            left: BorderSide(
                              width: 6.w,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        onSaved: (value) {
                          _email = value!;
                        },
                        validator: (email) {
                          if (email!.isEmpty)
                            return "Please enter Email";
                          else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) return "Not a valid email";
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          labelText: email,
                          // labelStyle: TextStyle(
                          //   fontSize: 18.sp,
                          //   color: labelColor,
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        focusNode: node,
                        obscureText: true,
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (password) {
                          if (password!.isEmpty)
                            return "Please enter Password";
                          else if (password.length < 5)
                            return "Password must contain 8 characters";
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            color: primaryColor,
                          ),
                          labelText: "PASSWORD",
                          // labelStyle: TextStyle(
                          //   fontSize: 18.sp,
                          //   color: labelColor,
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(primary: Colors.black),
                        child: Text(
                          forgotText,
                          style: TextStyle(
                            fontSize: 15.sp,
                            //color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: width.w - 40.w,
                        height: height.h * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              signIn();
                              // doLogin(context);
                              print(_email);
                              print(_password);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            primary: primaryColor, //background
                            onPrimary: Colors.white,
                          ), //foreground(text in button)
                          child: Text(
                            loginButton,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New User?",
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignupScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

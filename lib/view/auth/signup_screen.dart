import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreenState createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _name, _email, _password;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  void signUp() async {
    UserCredential credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email!, password: _password!);
    await credentials.user!.updateDisplayName(_name);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Account Created Successfully!"),
          content: Text(""),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Login"),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: height.h * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Container(
                  height: height.h * 0.30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          signupText,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(0.4),
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
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _nameController,
                      onSaved: (value) {
                        _name = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: primaryColor),
                        labelText: userName,
                        labelStyle: TextStyle(
                          color: labelColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _emailController,
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (email) {
                        if (email!.isEmpty)
                          return "Please enter Email";
                        else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) return "Not a valid Email";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: primaryColor),
                        labelText: email,
                        labelStyle: TextStyle(
                          color: labelColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _passwordController,
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: (password) {
                        if (password!.isEmpty)
                          return "Please enter a password";
                        else if (password.length < 6)
                          return "Password too weak";
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password, color: primaryColor),
                        labelText: password,
                        labelStyle: TextStyle(
                          color: labelColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      validator: (confirmPassword) {
                        if (confirmPassword!.isEmpty)
                          return "Please confirm Password";
                        else if (confirmPassword != _passwordController.text)
                          return "Password doesnt match";
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password, color: primaryColor),
                        labelText: passwordConfirm,
                        labelStyle: TextStyle(
                          color: labelColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: width.w - 30,
                      height: height.h * 0.06,
                      child: ElevatedButton(
                        child: Text(
                          signupButton,
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          primary: primaryColor,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            signUp();
                            print(_email);
                            print(_password);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

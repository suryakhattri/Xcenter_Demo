import 'package:flutter/material.dart';
import 'package:xcenter_demo/UI/ForgotPassword/forgot_password_page.dart';
import 'package:xcenter_demo/UI/Home/home_page.dart';

import '../SignUp/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _isLoading = false;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isApiCallProcess = false;

  String message = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _uiSetup(context);

    //   ProgressHUD(
    //   inAsyncCall: isApiCallProcess,
    //   opacity: 0.3,
    //   //valueColor:,
    //   key: _formKey,
    //   child: _uiSetup(context),
    // );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              // color: Colors.blue,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                //  Color.fromARGB(,1,2,4),
                Color.fromARGB(255, 98, 134, 166),
                Color.fromARGB(255, 98, 134, 166),
              ],
                  stops: [
                0.0,
                1.0
              ])),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Login Now",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 150.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Please login to continue using our app",
              style: TextStyle(
                fontSize: 17.0,
                color: Color.fromARGB(255, 160, 198, 241),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25.0, left: 30, right: 30),
                            child: Material(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white.withOpacity(0.0),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  //onSaved: (input) => loginRequestModel.email = input,
                                  style: const TextStyle(color: Colors.white),
                                  controller: _emailTextController,
                                  // key: _formKey,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18.0),
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                      color: Colors.white70,
                                      size: 20.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    hintText: "Username or Email",
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  // validator: (value) {
                                  //   if (value.isEmpty) {
                                  //     Pattern pattern =
                                  //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  //     RegExp regex = new RegExp(pattern);
                                  //     if (!regex.hasMatch(value))
                                  //       return "Please make sure your email address is valid.";
                                  //     else
                                  //       return null;
                                  //   }
                                  // },
                                  validator: (input) => !input!.contains('@')
                                      ? "Email Id should be valid"
                                      : null,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35.0, left: 30, right: 30),
                            child: Material(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white.withOpacity(0.0),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  // onSaved: (input) => loginRequestModel.password = input,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white),
                                  controller: _passwordTextController,
                                  // key: _formKey,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 18.0),
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.white70,
                                      size: 20.0,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The password field cannot be empty.";
                                    } else if (value.length < 6) {
                                      return "Enter at least 6 charactor password.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35.0, left: 35, right: 35),
                            child: Material(
                              // borderRadius: BorderRadius.circular(28.0),
                              // color: Colors.blue.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              color: const Color.fromARGB(255, 65, 74, 109),
                              elevation: 2.0,
                              //   highlightElevation: 2,
                              child: MaterialButton(
                                onPressed: () {
                                  if (validateAndSave()) {
                                    setState(() {
                                      isApiCallProcess = true;
                                    });
                                  }
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  Home()));
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                height: 50,
                                child: const Text(
                                  "LOGIN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                              // padding: const EdgeInsets.only(top: 5.0),
                              padding: const EdgeInsets.only(top: 0, left: 200),
                              //child: Align(
                              //   alignment: Alignment.topRight,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ForgotPassword()));
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: const Text(
                                  "Forgot password ?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              )),
                          //  ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 35, right: 35),
                            child: Material(
                              // borderRadius: BorderRadius.circular(28.0),
                              // color: Colors.blue.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              color: const Color.fromARGB(255, 65, 74, 109),
                              elevation: 2.0,
                              //   highlightElevation: 2,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                height: 50,
                                child: const Text(
                                  "REGISTER NOW",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
      ]),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

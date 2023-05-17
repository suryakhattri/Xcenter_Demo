import 'package:flutter/material.dart';
import 'package:xcenter_demo/UI/Login/login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //ForgotRequestModel forgotRequestModel;
  bool isApiCallProcess = false;

  String message = '';

  @override
  void initState() {
    super.initState();
    // forgotRequestModel = ForgotRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return _uiSetupForgotPassword(context);
    //   ProgressHUD(
    //   child: _uiSetupForgotPassword(context),
    //   inAsyncCall: isApiCallProcess,
    //   opacity: 0.3,
    // );
  }

  @override
  Widget _uiSetupForgotPassword(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //resizeToAvoidBottomPadding: false,
      body: Stack(children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                Color.fromARGB(255, 98, 134, 166),
                Color.fromARGB(255, 98, 134, 166),
              ],
                  stops: [
                0.0,
                1.0
              ])),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 120.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 190.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 230.0, left: 50, right: 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "We just need your register email address",
              style: TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 160, 198, 241),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.only(top: 250.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              " to send you password reset",
              style: TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(255, 160, 198, 241),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280.0),
          child: Center(
            child: Form(
                child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 30, right: 30),
                  child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white.withOpacity(0.0),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                        //  onSaved: (input) => forgotRequestModel.email = input,
                        controller: _emailTextController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 18.0),
                          prefixIcon: const Icon(
                            Icons.mail,
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
                          hintText: "Email address",
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        // validator: (input) {
                        //   if (input.isEmpty) {
                        //     Pattern pattern =
                        //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        //     RegExp regex = new RegExp(pattern);
                        //     if (!regex.hasMatch(input))
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
                  padding:
                      const EdgeInsets.only(top: 35.0, left: 35, right: 35),
                  child: Material(

                      // borderRadius: BorderRadius.circular(28.0),
                      // color: Colors.blue.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      color: const Color.fromARGB(255, 65, 74, 109),
                      elevation: 0.5,
                      //   highlightElevation: 2,
                      child: MaterialButton(
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Text(
                          "Send",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      )),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 35.0, right: 35.0),
                  child: Divider(
                    color: Colors.white,
                    //   height: 50,
                    thickness: 2,
                    indent: 20,
                    endIndent: 0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 100.0, right: 0.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: <Widget>[
                        const Text("Already have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          //  minWidth: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        )
                      ],
//                            ),
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

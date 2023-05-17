import 'package:flutter/material.dart';
import 'package:xcenter_demo/UI/Login/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _value;

  final List<String> _values = [];

  final bool _isLoading = false;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // SignUpRequestModel signupRequestModel;
  // SignUpResponseModel signUpResponseModel;
  bool isApiCallProcess = false;

  String message='';

  // @override
  // void initState(){
  //   super.initState();
  //   signupRequestModel = SignUpRequestModel();
  //
  // }

  @override
  void initState() {
    _values.addAll(["1", "2", "3", "4"]);
    _value = _values.elementAt(0);
    // signupRequestModel = SignUpRequestModel();
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    return _uiSetup(context);
    //   ProgressHUD(
    //   child: _uiSetup(context),
    //   inAsyncCall: isApiCallProcess,
    //   opacity: 0.3, key: key,
    // );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        //backgroundColor: Color.fromARGB(1, 98, 134, 166),
        backgroundColor: const Color.fromARGB(255, 98, 134, 166),
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
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
              padding:  EdgeInsets.only(top: 100.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Signup Now",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
           const Padding(
              padding:  EdgeInsets.only(top: 140.0, left: 70, right: 70),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Please sign up to enter a app. ",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 160, 198, 241),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Center(
                child: Form(
                    key: _formKey,
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
                                // controller: _emailTextController,
                                // onSaved: (input) => signupRequestModel.fullname = input,
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
                                  //prefixIcon: Icon(Icons., color: Colors.white70, size: 20.0,),
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

                                  hintText: "Name",
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The name field cannot be empty.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
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
                                // controller: _emailTextController,
                                // onSaved: (input) => signupRequestModel.fullname = input,
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
                                  //prefixIcon: Icon(Icons., color: Colors.white70, size: 20.0,),
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

                                  hintText: "Username",
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The name field cannot be empty.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

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
                                //  onSaved: (input) => signupRequestModel.password = input,
                                controller: _passwordTextController,
                                style: const TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
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
                                  } else if (value.length < 8) {
                                    return "Enter at least 8 charactor password.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

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
                                // onSaved: (input) => signupRequestModel.mobile = input,
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
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
                                  hintText: "Phone",
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The number field cannot be empty.";
                                  } else if (value.length < 10) {
                                    return "Enter at least 10 charactor number.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

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
                                //  onSaved: (input) => signupRequestModel.email = input,
                                controller: _emailTextController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
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
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                validator: (String? value){
                                  if(value!.isEmpty)
                                  {
                                    return "The name field cannot be empty.";
                                  }
                                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                                  {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 0),
                          child: Column(
                            children: <Widget>[
                              RadioListTile(
                                groupValue: radioItem,
                                activeColor: Colors.white,
                                title: MaterialButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //         new PrivacyNPolicy()));
                                  },
                                  //  minWidth: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    'I agree With privacy policy',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                ),

                                //Text('I agree With privacy policy', style: TextStyle(color: Colors.white, fontSize: 15.0),),
                                value: 'Item 1',
                                onChanged: (val) {
                                  setState(() {
                                    radioItem = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 15.0, left: 35, right: 35),
                          child: Material(

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              color: const Color.fromARGB(255, 65, 74, 109),
                              elevation: 0.5,
                              //   highlightElevation: 2,
                              child: MaterialButton(
                                onPressed: () {

                                  if(validateAndSave()) {
                                    setState(() {
                                      isApiCallProcess = true;
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         new ConfirmSignIN()));
                                    });
                                   }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                height: 50,
                                child: const Text(
                                  "Signup",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                       const Padding(
                          padding:  EdgeInsets.only(
                              top: 25.0, left: 35.0, right: 35.0),
                          child: Divider(
                            color: Colors.white,
                            //   height: 50,
                            thickness: 2,
                            indent: 20,
                            endIndent: 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 100.0, right: 0.0),
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
                    )
                ),
              ),
            ),
          ]),
        ));
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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  // State<SignUpPage> createState() => _SignUpPageState();
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  late String email, password, name;
  late bool _passwordVisible, _isLoading;

  void initState() {
    _passwordVisible = false;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(top: 65.0),
                  child: Center(
                    child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                  right: MediaQuery.of(context).size.width * .15,
                  left: MediaQuery.of(context).size.width * .15,
                ),
                child: Center(
                  child: Text(
                    "Welcome User!!",
                    style: GoogleFonts.sourceCodePro(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .15,
                  right: MediaQuery.of(context).size.width * .15,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * .55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 28,
                    ),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 18,
                            ),
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.sourceCodePro(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter your name",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return "Please Enter correct values";
                                }
                                return null;
                              },
                            ),
                          ),
                          // Next form field
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 6,
                              right: 6,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 16),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                bool emailValid = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(value!);
                                if (value!.isEmpty ||
                                    value.length < 4 ||
                                    !emailValid) {
                                  return "Please Enter correct email";
                                }
                                return null;
                              },
                            ),
                          ),
                          // Third form field
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 6,
                              right: 6,
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: Icon(!_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                hintText: "Enter your password",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 16),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return "Password should be 6 character or long";
                                }
                                return null;
                              },
                            ),
                          ),

                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: _isLoading
                                      ? SpinKitDoubleBounce(color: Colors.blue)
                                      : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                print("Checking creds");
                                setState(() {
                                  _isLoading = true;
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




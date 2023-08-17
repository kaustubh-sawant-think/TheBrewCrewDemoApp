import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:the_brew_crew/screens/authenticate/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_brew_crew/service/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/icons/coffee_bg.png'),
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/icons/logo.png',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Register Yourself ',
                      style: TextStyle(
                          color: Colors.brown[400],
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 240, 239),
                        shape: BoxShape.rectangle,
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Color.fromARGB(255, 105, 103, 103),
                        //       blurStyle: BlurStyle.inner,
                        //       blurRadius: 5)
                        // ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter First Name'
                                          : null,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'First Name',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {
                                        setState(() {
                                          firstName = value;
                                        });
                                      },
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter Last Name'
                                          : null,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'Last Name',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {
                                        setState(() {
                                          lastName = value;
                                        });
                                      },
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) =>
                                          val!.isEmpty ? 'Enter Email' : null,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) => val!.isEmpty
                                          ? 'Enter Phone Number'
                                          : null,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'Phone Number',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {
                                        setState(() {
                                          phoneNumber = value;
                                        });
                                      },
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) => val!.length < 6
                                          ? 'Password must be greater than 6 chars'
                                          : null,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'Password',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                    height: 50.0,
                                    child: TextFormField(
                                      validator: (val) => val != password
                                          ? 'Password and Confirm Password does not match.'
                                          : null,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 211, 203, 187))),
                                          border: OutlineInputBorder(),
                                          label: Text(
                                            'Confirm Password',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown),
                                          )),
                                      onChanged: (value) {},
                                    )),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Sign in with Email and Password
                            ElevatedButton(
                                onPressed: (() async {
                                  if (_formkey.currentState!.validate()) {
                                    print('email =' + email);
                                    print('password = ' + password);

                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);

                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Please enter a valid Email Address.';
                                      });
                                    }
                                  }
                                }),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.brown[400],
                                ),
                                child: Text('Register')),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 20.0,
                        child:
                            Text(error, style: TextStyle(color: Colors.red))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                      TextButton(
                          onPressed: (() {
                            // Navigator.of(context).pop(SignIn());
                            widget.toggleView();
                          }),
                          child: Text(
                            'back to login',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

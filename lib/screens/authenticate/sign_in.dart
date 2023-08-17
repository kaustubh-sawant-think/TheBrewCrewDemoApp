import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:the_brew_crew/screens/authenticate/register.dart';
import 'package:the_brew_crew/service/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

// Text Field State
  String email = '';
  String password = '';
  String error = '';
  DateTime pre_backpressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Callback func when back button is pressed.
        final timegap = DateTime.now().difference(pre_backpressed);
        print(pre_backpressed);
        print(timegap);

        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpressed = DateTime.now();

        if (cantExit) {
          final snack = SnackBar(
            backgroundColor: Colors.brown[400],
            content: Text('Press back button again to close the app.'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/icons/coffee_bg.png'),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                      height: 150,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: SizedBox(
                                        height: 50.0,
                                        child: TextFormField(
                                          validator: (val) => val!.isEmpty
                                              ? 'Enter Email'
                                              : null,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
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
                                                style: TextStyle(fontSize: 14),
                                              )),
                                          onChanged: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                        )),
                                  ),
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (() {}),
                                  child: const Text(
                                    'Forgot Password ?',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Sign in with Email and Password
                              ElevatedButton(
                                  onPressed: (() async {
                                    if (_formkey.currentState!.validate()) {
                                      print('email =' + email);
                                      print('password = ' + password);

                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);

                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'Could not Sign In with those credentials.';
                                        });
                                      }
                                    }
                                  }),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.brown[400],
                                  ),
                                  child: Text('Login')),
                            ],
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                            height: 20.0,
                            child: Text(error,
                                style: TextStyle(color: Colors.red))),
                      ),
                      TextButton(
                          onPressed: (() {
                            widget.toggleView();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> widget.toggleView()));
                          }),
                          child: Text(
                            'New user? Register Now',
                            style: TextStyle(color: Colors.brown[400]),
                          )),
                      const Divider(
                        color: Colors.grey,
                        indent: 30.0,
                        endIndent: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'or sign up using',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Sign in with Facebook
                          ElevatedButton(
                            onPressed: (() {}),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape:
                                    MaterialStateProperty.all(CircleBorder())),
                            child: Image.asset(
                              'assets/icons/facebook.png',
                              height: 20,
                            ),
                          ),

                          ElevatedButton(
                            onPressed: (() {}),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape:
                                    MaterialStateProperty.all(CircleBorder())),
                            child: Image.asset(
                              'assets/icons/google.png',
                              height: 20,
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () async {
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print('error signing in');
                              } else {
                                print('successfully logged in');
                                print(result.uid);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder())),
                            child: Image.asset(
                              'assets/icons/guest.png',
                              height: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Copyright@TheTDRCafe',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

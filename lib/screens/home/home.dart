import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_brew_crew/screens/splash_screen.dart';
import 'package:the_brew_crew/service/auth.dart';
import 'package:the_brew_crew/utility/utility.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utility util = Utility();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          automaticallyImplyLeading: false,
          title: Text('The 101 Cafe'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    util.show_custom_dialog(context);
                  },
                  splashColor: Colors.brown[300],
                  child: Image.asset('assets/icons/coffee_mug2.gif',
                      height: 50, width: 50)),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/coffee_mug2.gif',
              height: 200.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Welcome \n to \n The 101 Cafe',
                  style: GoogleFonts.greatVibes(
                      fontSize: 40.0,
                      color: Colors.brown[400],
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:the_brew_crew/service/auth.dart';

class Utility {
  final AuthService _auth = AuthService();

  Future<void> show_custom_dialog(BuildContext context) async {
    return showDialog(
        useSafeArea: true,
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown[100],
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.brown[400]),
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: [Text('Are you sure, you want to sign out !')],
            )),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (() {
                      Navigator.pop(context, 'No');
                    }),
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.brown[400]),
                    ),
                  ),
                  TextButton(
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.brown[400]),
                      ),
                      onPressed: (() async {
                        await _auth.signOut();
                        Navigator.pop(
                          context,
                          'Yes',
                        );
                      })),
                ],
              ),
            ],
          );
        });
  }
}

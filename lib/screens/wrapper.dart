import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brew_crew/screens/authenticate/authenticate.dart';
import 'package:the_brew_crew/models/user.dart';
import 'package:the_brew_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

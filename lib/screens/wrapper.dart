import 'package:brew_app_flutter_firebase/model/User.dart';
import 'package:brew_app_flutter_firebase/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

import 'package:brew_app_flutter_firebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print(user);

    return Authenticate();
  }
}

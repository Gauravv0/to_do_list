import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        // ignore: deprecated_member_use
        ..removeCurrentSnackBar()
        // ignore: deprecated_member_use
        ..showSnackBar(SnackBar(content: Text(text)));
}

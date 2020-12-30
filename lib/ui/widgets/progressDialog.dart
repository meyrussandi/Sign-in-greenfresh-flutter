import 'package:flutter/material.dart';

progressDialog(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black45.withOpacity(0.65),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) => Center(
            child: CircularProgressIndicator(),
          ));
}

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar showWarningProgressMessage(String _message, BuildContext _context) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: Colors.amber,
    isDismissible: true,
    duration: null,
    icon: const Icon(Icons.hourglass_bottom, color: Colors.white),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.grey,
    progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6BC1FF)),
    messageText: Text(
      _message,
      style: const TextStyle(
        fontFamily: 'UbuntuRegular',
        fontSize: 16.0,
        color: Colors.white,
      ),
    ),
  )..show(_context);
}

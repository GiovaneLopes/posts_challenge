import 'package:flutter/widgets.dart';

abstract class Failure {
  final String errorMessage;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.errorMessage = '',
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
  }
}

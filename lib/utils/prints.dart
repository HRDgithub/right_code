import 'package:flutter/foundation.dart';

pError(String title, dynamic error) {
  if (kDebugMode || kReleaseMode) {
    printWarning("*********** ${title.toString()} ***********");
    printError("-- ${error.toString()} --");
    print("\n");
  }
}

pCorrect(String title, dynamic value) {
  if (kDebugMode) {
    printWarning("*********** ${title.toString()} ***********");
    printCorrect("-- ${value.toString()} --");
    print("\n");
  }
}

pWarning(String title, dynamic value) {
  if (kDebugMode) {
    printError("*********** ${title.toString()} ***********");
    printWarning("-- ${value.toString()} --");
    print("\n");
  }
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void printCorrect(String text) {
  print('\x1B[32m$text\x1B[32m');
}

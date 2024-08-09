import 'package:right_code_app/widgets/show_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseException implements Exception {
  SupabaseException(this.message);

  void initState() async {
    await showWarningDialog(
        header: "Error", title: message, status: AlertDialogStatus.error);
  }

  final String message;
}

// Exception handler function
SupabaseException handleSupabaseException(PostgrestException exception) {
  switch (exception.code) {
    case "23505":
      throw SupabaseException("Already exist");
    case "400":
      throw SupabaseException("Bad Request");
    case "401":
      throw SupabaseException("Unauthorized");
    case "402":
      throw SupabaseException("Payment Required");
    case "403":
      throw SupabaseException("Forbidden");
    case "404":
      throw SupabaseException("Not Found");
    case "405":
      throw SupabaseException("Method Not Allowed");
    case "406":
      throw SupabaseException("Not Acceptable");
    case "407":
      throw SupabaseException("Proxy Authentication Required");
    case "408":
      throw SupabaseException("Request Timeout");
    case "409":
      throw SupabaseException("Already exist");
    case "410":
      throw SupabaseException("Gone");
    case "411":
      throw SupabaseException("Length Required");
    case "412":
      throw SupabaseException("Precondition Failed");
    case "413":
      throw SupabaseException("Payload Too Large");
    case "414":
      throw SupabaseException("URI Too Long");
    case "415":
      throw SupabaseException("Unsupported Media Type");
    case "416":
      throw SupabaseException("Range Not Satisfiable");
    case "417":
      throw SupabaseException("Expectation Failed");
    case "418":
      throw SupabaseException("I'm a teapot");
    case "421":
      throw SupabaseException("Misdirected Request");
    case "422":
      throw SupabaseException("Unprocessable Entity");
    case "423":
      throw SupabaseException("Locked");
    case "424":
      throw SupabaseException("Failed Dependency");
    case "425":
      throw SupabaseException("Too Early");
    case "426":
      throw SupabaseException("Upgrade Required");
    case "428":
      throw SupabaseException("Precondition Required");
    case "429":
      throw SupabaseException("Too Many Requests");
    case "431":
      throw SupabaseException("Request Header Fields Too Large");
    case "451":
      throw SupabaseException("Unavailable For Legal Reasons");
    default:
      throw SupabaseException("Unhandled Error");
  }
}

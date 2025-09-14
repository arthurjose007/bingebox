import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..connectionTimeout = Duration(seconds: 10) // Reduce timeout
      ..badCertificateCallback = (cert, host, port) => true; // Bypass SSL (temporary)
  }
}



import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetService {
  final _checker = InternetConnection.createInstance(
    useDefaultOptions: false,
    customCheckOptions: [
      InternetCheckOption(
        uri: Uri.parse('https://one.one.one.one'),
        timeout: const Duration(seconds: 2),
      ),
    ],
  );

  Future<bool> hasInternet() => _checker.hasInternetAccess;
}

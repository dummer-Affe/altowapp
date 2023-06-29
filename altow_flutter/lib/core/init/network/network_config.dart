import 'package:vexana/vexana.dart';

class NetworkConfig {
  
  late String baseUrl;
  late BaseOptions options;

  NetworkConfig() {
    baseUrl = 'http://10.0.2.2:9191/';
    options = BaseOptions(baseUrl: baseUrl);
  }
}

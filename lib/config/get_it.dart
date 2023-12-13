import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt config = GetIt.instance;

congiration() async {
  config.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}

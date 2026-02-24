import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/navigation.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/internacionalization/internationalization.utils.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  String initialRoute = await Routes.initialRoute;

  runApp(GetMaterialApp(
    title: 'SME-Prefeitura-São-Paulo',

    initialRoute: initialRoute,
    getPages: Navigation.routes,
    theme: ThemeData(
      primaryColor: ColorsTheme.PRIMARY,
      accentColor: ColorsTheme.ACCENT,
      backgroundColor: ColorsTheme.BACKGROUND_LIGHT,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: ColorsTheme.PRIMARY
      )
    ),
    translations: InternationalizationUtils(), // your translations
      locale: Locale('pt', 'BR'), // translations will be displayed in that locale
      fallbackLocale: Locale('pt', 'BR'), // specify the fallback locale in case an invalid locale is selected.
    )
  );
}

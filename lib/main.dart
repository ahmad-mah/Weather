import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/helpers/styled_status_bar.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  styledStatusBar();

  setupServiceLocator();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          routerConfig: AppRouter.router,
        ),
      ),
    ),
  );
}

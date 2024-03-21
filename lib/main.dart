import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hp_thermal_printer/src/localization/locale_keys.dart';
import 'package:hp_thermal_printer/src/model/CounterModel.dart';
import 'package:hp_thermal_printer/src/provider/provider.dart';
import 'package:hp_thermal_printer/src/res/constant/app_constants.dart';
import 'package:hp_thermal_printer/src/res/constant/color_constants.dart';
import 'package:hp_thermal_printer/src/res/style/text_style.dart';
import 'package:hp_thermal_printer/src/routes/route_name.dart';
import 'package:hp_thermal_printer/src/routes/routes.dart';
import 'package:hp_thermal_printer/src/util/l10n.dart';

Future<void> main() async {
  /*Easy Localization Initialized*/
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /*Set default portrait screen orientations*/
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
      path: AssetsConstants.l10nAssets,
      supportedLocales: L10n.all,
      fallbackLocale: L10n.all[2],
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*Set the desired status bar color here*/
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.colorPrimaryDark,
    ));
    return ScreenUtilInit( /*UI display a reasonable layout on different screen sizes*/
      designSize: Size(390, 844),
      /*figma screen height and width,base on we have to design further screen*/
      builder: (context, child) {
        return Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              /*Localization config*/
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              title: LocaleKeys.strAppTitle.tr(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,/*Remove banner on screen*/
              /*Define route*/
              onGenerateRoute: Routes.generateRoute,
              initialRoute: RoutesName.screenApiList,
            );
          },
        );
      },
    );
  }
}































/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: StateNotifierProviderRiverPotExample(),
    );
  }
}*/

class StateNotifierProviderRiverPotExample extends ConsumerWidget {
  const StateNotifierProviderRiverPotExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CounterModel countr = ref.watch(counterViewModelProvider);
    int countrd = ref.watch(stateNotifierProvider);
    String date = ref.watch(stateNotifierProviderD);
    return Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.strAppTitle.tr())),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${countr.count}'),
            Text('$date'),
            ElevatedButton(
              onPressed: () {
                ref.read(counterViewModelProvider.notifier).increment();
              },
              child: Text(
                'Increment Count',
                style: AppStyle.instance.h2Bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(stateNotifierProviderD.notifier).getDate();
              },
              child: const Text('Deincrement Count'),
            )
          ],
        )));
  }
}

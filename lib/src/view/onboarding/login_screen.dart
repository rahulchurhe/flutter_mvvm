import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hp_thermal_printer/src/localization/locale_keys.dart';

import '../../model/CounterModel.dart';
import '../../provider/provider.dart';
import '../../res/constant/app_constants.dart';
import '../../res/constant/color_constants.dart';
import '../../res/style/text_style.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CounterModel countr = ref.watch(counterViewModelProvider);
    int countrd = ref.watch(stateNotifierProvider);
    String date = ref.watch(stateNotifierProviderD);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height:
              MediaQuery.of(context).size.height * 0.26.h, // First part height
              color: ColorConstants.colorPrimary,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.strLoginTitle.tr(),
                      style: AppStyle.instance.h2Bold
                      /*style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700)*/,
                    ),
                    SvgPicture.asset(
                      AssetsConstants.loginImage,
                      height: 90.sp,
                      width: 90.sp,
                      fit: BoxFit.fill,
                    )
                  ],
                ),

              ),
            ),
            /* SvgPicture.asset(
                    AssetsConstants.loginImage,
                    height: 30,
                    width: 30,
                    fit: BoxFit.fill,
                  )*/
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    color: ColorConstants.colorPrimary,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Text(
                          'Login to your Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0.h),
                          child: Column(children: [
                            SizedBox(height: 30.h),
                            TextField(
                              style: TextStyle(fontSize: 14.sp),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0.sp),
                                ),
                                contentPadding: EdgeInsets.all(12.0.sp),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextField(
                              obscureText: true,
                              style: TextStyle(fontSize: 14.sp),
                              // Hides the entered text (password field)
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0.sp),
                                ),
                                contentPadding: EdgeInsets.all(12.0.sp),
                              ),
                            ),
                            SizedBox(height: 36.h),
                            Text('${countr.count}'),
                            Text('$date'),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(counterViewModelProvider.notifier).increment();
                                ref.read(stateNotifierProviderD.notifier).getDate();
                                // Do something with the entered email and password
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(40),
                                // fromHeight use double.infinity as width and 40 is the height
                                primary: ColorConstants.colorPrimary,
                                // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      40.0), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10.0.h), // Button padding
                              ),
                              child: Text(
                                'Login',
                                style:
                                TextStyle(fontSize: 18.sp, color: Colors.black),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class StateNotifierProviderRiverPotExample extends ConsumerWidget {
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
}*/

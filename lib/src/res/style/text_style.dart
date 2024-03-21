import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_constants.dart';
import '../constant/color_constants.dart';

class AppStyle {
  static AppStyle instance = AppStyle._init();
  AppStyle._init();

  final TextStyle h2Bold =  TextStyle(
    color: ColorConstants.colorEditText,
    fontSize: 30.sp,
    fontFamily: FontFamilyConstant.djr_bold,
  );
}



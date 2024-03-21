/*Shared Pref Constant*/
abstract class SharedPrefConstant {
  static const bool loginStatus = false;
}

/*Font Family Constant*/
abstract class FontFamilyConstant {
  static const String helvetica = 'Helvetica';
  static const String djr_micro = 'FormaDJRMicro';
  static const String djr_medium = 'FormaDJRMicroMedium';
  static const String djr_bold = 'FormaDJRMicroBold';
}

/*Assets Constants*/
abstract class AssetsConstants {
  static const String imageAssets = 'assets/images/';
  static const String l10nAssets = 'assets/l10n';
  static const String splashImage = '${imageAssets}splash_large.png';
  static const String loginImage = '${imageAssets}ic_add_layouts.svg';
}

/*Database Constants*/
abstract class DBConst {
  static const String isImportant = 'isImportant';
  static const String id = 'id';
  static const String title = 'title';
  static const String describtion = 'describtion';
  static const newColumn = 'new_column';
  static const String tableName = 'todoTable';
  static const String tableNameTwo = 'todoTableTwo';
}
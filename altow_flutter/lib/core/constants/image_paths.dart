import '/core/states/app_settings/app_settings.dart';

import '/core/extensions/asset_path_extensions.dart';

class ImagePaths {
  static final String curve = 'curve'.toPNG;
  static final String curve2 = 'curve2'.toPNG;
  static final String altow = 'altow'.toPNG;
  static final String homePic0 = 'home_0'.toHomeJpg;
  static final String homePic1 = 'home_1'.toHomeJpg;
  static final String homePic2 = 'home_2'.toHomeJpg;
  static final String homePic3 = 'home_3'.toHomeJpg;
  static final String homePic4 = 'home_4'.toHomeJpg;
  static final String homePic5 = 'home_5'.toHomeJpg;
  static final String homePic6 = 'home_6'.toHomeJpg;
  static final String homePic7 = 'home_7'.toHomeJpg;
  static final String homePic8 = 'home_8'.toHomeJpg;
  static final String homePic9 = 'home_9'.toHomeJpg;
  static final String homePic10 = 'home_10'.toHomeJpg;
  static final String homePic11 = 'home_11'.toHomeJpg;

  static final String ueberUnsPic0 = 'ueber_uns_0'.toUeberUnsJpg;
  static final String ueberUnsPic1 = 'ueber_uns_1'.toUeberUnsJpg;
  static final String ueberUnsPic2 = 'ueber_uns_2'.toUeberUnsJpg;
  static final String ueberUnsPic3 = 'ueber_uns_3'.toUeberUnsJpg;
  static final String ueberUnsPic4 = 'ueber_uns_4'.toUeberUnsJpg;
  static final String ueberUnsPic5 = 'ueber_uns_5'.toUeberUnsJpg;
  static final String ueberUnsPic6 = 'ueber_uns_6'.toUeberUnsJpg;
  static final String ueberUnsPic7 = 'ueber_uns_7'.toUeberUnsJpg;
  static final String ueberUnsPic8 = 'ueber_uns_8'.toUeberUnsJpg;
  static final String ueberUnsPic9 = 'ueber_uns_9'.toUeberUnsJpg;
  static final String ueberUnsPic10 = 'ueber_uns_10'.toUeberUnsJpg;
  static final String ueberUnsPic11 = 'ueber_uns_11'.toUeberUnsJpg;

  static final String jobsPic0 = 'jobs_0'.toJobsJpg;
  static final String jobsPic1 = 'jobs_1'.toJobsJpg;

  static final String altowPic0 = 'altowAcademy_0'.toAltowAcademyJpg;
  static final String altowPic1 = 'altowAcademy_1'.toAltowAcademyJpg;
  static final String altowPic2 = 'altowAcademy_2'.toAltowAcademyJpg;
  static final String altowPic3 = 'altowAcademy_3'.toAltowAcademyJpg;
  static final String altowPic4 = 'altowAcademy_4'.toAltowAcademyJpg;
  static final String altowPic5 = 'altowAcademy_5'.toAltowAcademyJpg;

  static final String altowLogoDark = 'altowBg'.toPNG;
  static final String altowLogolight = 'altowBgWhite'.toPNG;
  static final String altowLogoValid =
      AppSettings.instance.appearance.name == "dark"
          ? altowLogoDark
          : altowLogolight;
}

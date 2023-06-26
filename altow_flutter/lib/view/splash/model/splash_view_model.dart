import 'package:mobx/mobx.dart';

import '/core/init/navigation/navigation_enums.dart';
import '/core/init/navigation/navigation_service.dart';
import '/core/states/app_settings/app_settings.dart';
import '../../../core/states/app_user/app_user.dart';
import '../../../product/init/enum/login_provider_type_enum.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  @observable
  bool isSetupCompleted = false;

  @action
  Future<void> init() async {
    await AppSettings.instance.setup();
    isSetupCompleted = true;
  }

  Future<void> checkAuth() async {
    if (await AppUser.instance.checkAuth()) {
      RegistrationTracker.startLoginProcess(
          context: AppSettings.instance.context!,
          type: ProviderType.mobile,
          withoutOtp: true,
          data: {
            'mobilePhone': AppUser.instance.informations!.mobilePhone,
            'email': AppUser.instance.informations?.email
          });
    } else {
      await NavigationService.pushRemoveUntil(NavigationEnums.login);
    }
  }
}

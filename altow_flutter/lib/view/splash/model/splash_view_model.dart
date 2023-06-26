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

  Future<void> navigateToLogin() async {
    String? rememberedPhone = AppUser.instance.user?.mobilePhone;
    print(AppUser.instance.user!.email);
    print(AppUser.instance.user!.loginProviderToken);
    print(AppUser.instance.user!.mobilePhone);
    print(AppUser.instance.user!.password);
    if (rememberedPhone == null) {
      await NavigationService.pushRemoveUntil(NavigationEnums.login);
    } else {
      RegistrationTracker.startLoginProcess(
          context: AppSettings.instance.context!,
          type: ProviderType.mobile,
          withoutOtp: true,
          data: {'mobilePhone': AppUser.instance.user!.mobilePhone});
    }
  }
}

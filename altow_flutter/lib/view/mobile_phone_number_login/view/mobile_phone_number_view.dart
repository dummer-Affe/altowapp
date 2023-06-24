import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../base/base_design.dart';
import '../model/mobile_phone_number_view_model.dart';

class MobilePhoneNumberView extends StatefulWidget {
  const MobilePhoneNumberView({super.key});

  @override
  State<MobilePhoneNumberView> createState() => _MobilePhoneNumberViewState();
}

class _MobilePhoneNumberViewState extends State<MobilePhoneNumberView> {
  var model = MobilePhoneNumberViewModel();
  IntPhoneNumber phone =
      IntPhoneNumber(code: "90", dial_code: "+90", number: "");
  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return BaseDesign(
        onBackButtonPressed: () {
          model.onWillPop(context);
        },
        onWillPop: () async {
          return await model.onWillPop(context);
        },
        onSubmitButtonPressed: () {
          model.controlPhoneNumber(phone, context);
        },
        title: "Mobile Number",
        text: "Enter your mobile number",
        submitButtonText: "Continue",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InternationalPhoneNumberInput(
              height: AppFontsPanel.loginCountryCodeH,
              betweenPadding: figma.px(21, Axis.horizontal),
              formatter: MaskedInputFormatter("### ### ## ##"),
              phoneConfig: PhoneConfig(
                  focusedColor: AppColors.secondary,
                  enabledColor: AppColors.secondary,
                  radius: 7,
                  autoFocus: true,
                  hintText: "",
                  borderWidth: 1.5,
                  textStyle: AppFontsPanel.phoneStyle),
              dialogConfig: DialogConfig(
                textStyle: AppFontsPanel.countrySheetTextStyle,
                titleStyle: AppFontsPanel.countrySheetTitleStyle,
                searchBoxTextStyle: AppFontsPanel.searchCountryStyle,
                searchBoxHintStyle: AppFontsPanel.searchCountryStyle,
              ),
              initCountry: CountryCodeModel(
                  name: "Turkey", dial_code: "+90", code: "TR"),
              countryConfig: CountryConfig(
                  textStyle: AppFontsPanel.phoneStyle,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.background,
                    boxShadow: const [
                      BoxShadow(blurRadius: 4, color: Color(0x66FAFAFA))
                    ],
                  )),
              onInputChanged: (phone) {
                this.phone = phone;
              },
            ),
            figma.spacer(15, Axis.vertical),
            Observer(
              builder: (context) {
                return isError
                    ? Text(
                        model.errorText!,
                        style: AppFontsPanel.errorStyle,
                      )
                    : const SizedBox();
              },
            )
          ],
        ));
  }

  bool get isError => model.errorText != null;
  bool get canPop => AppSettings.instance.canPop;
}

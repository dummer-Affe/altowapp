import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/view/splash/model/splash_view_model.dart';
import '../../base/context_updater.dart';
import 'splash_animation_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var model = SplashViewModel();

  @override
  void initState() {
    model.init();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContextUpdater(
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: Colors.white
            )),
            Observer(
              builder: (context) {
                return model.isSetupCompleted
                    ? SplashAnimationView(
                        onFinishAnimation: () {
                          model.checkAuth();
                        },
                        isFadeStart: true,
                      )
                    : SplashAnimationView(
                        onFinishAnimation: () {},
                        isFadeStart: false,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

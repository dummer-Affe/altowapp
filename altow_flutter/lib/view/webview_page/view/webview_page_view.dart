import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/constants/icon_paths.dart';
import '../../base/context_updater.dart';
import '../model/webview_page_model_view.dart';

class WebviewPage extends StatefulWidget {
  final String? url;
  const WebviewPage({super.key, required this.url});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  var model = WebviewPageModelView();
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  _WebviewPageState()
      : gestureRecognizers = {Factory(() => EagerGestureRecognizer())};

  @override
  void initState() {
    model.init(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    var figma = Figma.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(children: [
          figma.spacer(30, Axis.horizontal),
          Image.asset(
            IconPaths.altowIcon,
            height: figma.px(25, Axis.vertical),
            fit: BoxFit.fitHeight,
          ),
          figma.spacer(8, Axis.horizontal),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FigmaText(
                "Altow",
                height: 24,
                style: figma.style(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(figma.px(8, Axis.horizontal)),
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              )),
          figma.spacer(20, Axis.horizontal),
        ]),
      ),
      body: Center(
        child: ContextUpdater(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Observer(
              builder: (context) => model.controller != null
                  ? Expanded(
                      child: Center(
                        child: WebViewWidget(
                          controller: model.controller!,
                          gestureRecognizers: gestureRecognizers,
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
            )
          ]),
        ),
      ),
    );
  }
}

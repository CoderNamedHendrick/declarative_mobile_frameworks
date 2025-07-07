import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_declarative_ui/native_api/native_mobile_ui.g.dart';

class CalculatorPlatformView extends StatefulWidget {
  const CalculatorPlatformView({super.key, required this.onResult});

  final ValueChanged<String> onResult;

  @override
  State<CalculatorPlatformView> createState() => _CalculatorPlatformViewState();
}

class _CalculatorPlatformViewState extends State<CalculatorPlatformView> implements NativeMobileFlutterApi {
  @override
  void initState() {
    super.initState();
    NativeMobileFlutterApi.setUp(this);
  }

  @override
  Widget build(BuildContext context) {
    const String viewType = 'calculator-platform-view';
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  @override
  void onSumResult(String result) {
    widget.onResult(result);
  }
}

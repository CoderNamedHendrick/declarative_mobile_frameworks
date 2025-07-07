package com.example.mobile_declarative_ui

import NativeMobileFlutterApi
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterFragmentActivity() {
    private var api: NativeMobileFlutterApi? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        api = NativeMobileFlutterApi(flutterEngine.dartExecutor.binaryMessenger)
        flutterEngine.platformViewsController.registry.registerViewFactory(
            "calculator-platform-view",
            NativeViewFactory(
                onClick = {
                    api?.onSumResult(it) {}
                }
            )
        )

    }
}

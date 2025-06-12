package com.example.mobile_declarative_ui

import NativeMobileUi.FlutterError
import NativeMobileUi.NativeMobileHostApi
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

typealias FlutterResultCallback = NativeMobileUi.Result<String?>

class MainActivity : FlutterActivity(), NativeMobileHostApi {
    private var nativeUiResultCallback: FlutterResultCallback? = null
    private val composeActivityRequestCode: Int = 4

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        NativeMobileHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (nativeUiResultCallback == null) return

        if (requestCode == composeActivityRequestCode && resultCode == RESULT_OK) {

            val value = data?.getStringExtra(ComposeActivity.REPLY_MESSAGE)
            if (value == null) {
                nativeUiResultCallback?.error(FlutterError("code", "message", "details"))
                return
            }
            nativeUiResultCallback?.success(value)
        }
    }

    override fun getNativeUiResult(result: NativeMobileUi.Result<String?>) {
        nativeUiResultCallback = result
        val intent = Intent(this, ComposeActivity::class.java)
        startActivityForResult(intent, composeActivityRequestCode)
    }
}

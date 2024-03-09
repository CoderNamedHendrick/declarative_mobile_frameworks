package com.example.mobile_declarative_ui

import FlutterError
import NativeMobileHostApi
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

typealias FlutterResultCallback = (Result<String>) -> Unit

class MainActivity : FlutterActivity(), NativeMobileHostApi {
    private var nativeUiResultCallback: FlutterResultCallback? = null
    private val composeActivityRequestCode: Int = 4

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        NativeMobileHostApi.setUp(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (nativeUiResultCallback == null) return@onActivityResult

        if (requestCode == composeActivityRequestCode && resultCode == RESULT_OK) {

            val value = data?.getStringExtra(ComposeActivity.REPLY_MESSAGE)
            if (value == null) {
                nativeUiResultCallback?.invoke(
                    Result.failure(FlutterError("code", "message", "details"))
                )
                return@onActivityResult
            }
            nativeUiResultCallback?.invoke(Result.success(value))
        }
    }

    override fun getNativeUiResult(callback: (Result<String>) -> Unit) {
        nativeUiResultCallback = callback
        val intent = Intent(this, ComposeActivity::class.java)
        startActivityForResult(intent, composeActivityRequestCode)
    }
}

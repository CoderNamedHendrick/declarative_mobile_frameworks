package com.example.native_navigation

import android.content.Intent
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val events = "com.hendrick.navigateChannel"
    private var methodChannelResult: MethodChannel.Result? = null

    final val SCREEN_TWO_REQUEST_CODE: Int = 4;

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            events
        ).setMethodCallHandler { call, result ->
            methodChannelResult = result
            if (call.method == "navigateFunction") {
                val intent: Intent = Intent(this, ComposeActivity::class.java)
                startActivityForResult(intent, SCREEN_TWO_REQUEST_CODE)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == SCREEN_TWO_REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                val value = data?.getStringExtra(ComposeActivity.MESSAGE_REPLY)
                methodChannelResult?.success("Message From Android:: $value")
            }
        }
    }
}

package com.example.mobile_declarative_ui

import android.content.Context
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.ComposeView
import com.example.mobile_declarative_ui.ui.theme.AndroidTheme
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(private val onClick: (String) -> Unit) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(
        context: Context,
        viewId: Int,
        args: Any?,
    ): PlatformView {
        @Suppress("UNCHECKED_CAST")
        val creationParams = args as Map<String, Any>?
        return NativeView(context, viewId, creationParams, onClick)
    }
}

internal class NativeView(
    context: Context,
    id: Int,
    creationParams: Map<String, Any>?,
    onClick: (String) -> Unit
) : PlatformView {

    private var composeView: ComposeView? = ComposeView(context).apply {
        println("Rendering view with id: $id")
        setContent {
            AndroidTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    ComposeBody(onClick = onClick)
                }
            }
        }
    }

    override fun getView() = composeView


    override fun dispose() {
        composeView = null
    }
}
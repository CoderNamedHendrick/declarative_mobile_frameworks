package com.example.native_navigation

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.native_navigation.ui.theme.AndroidTheme

class ComposeActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            AndroidTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Column (
                        modifier = Modifier.padding(horizontal = 12.dp),
                        verticalArrangement = Arrangement.Center
                    ) {
                        Greeting("Android, Welcome to Compose Side")
                        Spacer(modifier = Modifier.height(10.dp))
                        Button(onClick = {
                            val replyIntent = Intent()
                            replyIntent.putExtra(MESSAGE_REPLY, "Message from composable")
                            setResult(RESULT_OK, replyIntent)
                            finish()
                        }) {
                            Text(
                                text = "Click me to send message to flutter side",
                                fontSize = 14.sp,
                            )
                        }
                    }
                }
            }
        }
    }

    companion object {
        const val MESSAGE_REPLY: String = "message_reply"
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    AndroidTheme {
        Greeting("Android")
    }
}
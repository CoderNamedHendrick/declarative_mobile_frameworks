package com.example.mobile_declarative_ui

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mobile_declarative_ui.ui.theme.AndroidTheme

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
                    ComposeBody {
                        val replyIntent = Intent()
                        replyIntent.putExtra(REPLY_MESSAGE, it)
                        setResult(RESULT_OK, replyIntent)
                        finish()
                    }
                }
            }
        }
    }

    companion object {
        const val REPLY_MESSAGE: String = "reply_message"
    }
}

@Composable
fun ComposeBody(modifier: Modifier = Modifier, onClick: (value: String) -> Unit) {
    var input1 by remember {
        mutableStateOf("")
    }
    var input2 by remember {
        mutableStateOf("")
    }

    Column(
        modifier = modifier.padding(horizontal = 12.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Greeting("Enter two numbers whose sum we're going to send to flutter")

        Spacer(modifier = modifier.height(15.dp))

        BasicTextField(
            value = input1,
            modifier = modifier
                .fillMaxWidth()
                .background(color = MaterialTheme.colorScheme.primaryContainer)
                .padding(6.dp),
            singleLine = true,
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done,
            ),
            textStyle = MaterialTheme.typography.bodyLarge,
            onValueChange = {
                input1 = it
            },
        )
        Spacer(modifier = modifier.height(10.dp))
        BasicTextField(
            value = input2,
            modifier = modifier
                .fillMaxWidth()
                .background(color = MaterialTheme.colorScheme.primaryContainer)
                .padding(6.dp),
            singleLine = true,
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Done,
            ),
            textStyle = MaterialTheme.typography.bodyLarge,
            onValueChange = {
                input2 = it
            },
        )
        Spacer(modifier = modifier.height(20.dp))
        Text(text = "Sum of inputs: ${sum(input1, input2)}")
        Button(onClick = {
            onClick("${sum(input1, input2)}")
        }) {
            Text(
                text = "Send sum to flutter",
                fontSize = 14.sp,
            )
        }
    }
}

fun sum(input1: String, input2: String): Int {
    val val1 = (input1.toIntOrNull() ?: 0).toInt()
    val val2 = (input2.toIntOrNull() ?: 0).toInt()
    return val1 + val2
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "$name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    AndroidTheme {
        ComposeBody {}
    }
}
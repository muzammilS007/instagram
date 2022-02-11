package com.example.instagram

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
    private val CHANNEL = "test_activity"
    lateinit var resultValue : MethodChannel.Result




    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.let {
            GeneratedPluginRegistrant.registerWith(it)
            MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method.equals("startNewActivity")) {
                    resultValue=result
                    startNewActivity()
                }

            }
        }
    }
    private fun startNewActivity() {
        val intent = Intent(this, CameraActivity::class.java)
        startActivityForResult(intent,101)
    }
    override fun onActivityResult(requestCode: Int, result: Int, intent: Intent?) {
         super.onActivityResult(requestCode, result, intent)
        if(requestCode == 101) {
            if (result == Activity.RESULT_OK) {
                val data = intent?.getStringExtra("path")
                resultValue.success(data.toString())
            } else{
                resultValue.success("Hello From native")
            }
        }
    }

}

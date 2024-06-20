package com.example.inclusive_hue

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "overlay_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "updateColorFilter") {
                val toggled = call.argument<Boolean>("toggled") ?: false
                val adjustment = call.argument<Double>("adjustment") ?: 0.0
                val severity = call.argument<Double>("severity") ?: 0.0
                val type = call.argument<String>("type") ?: "PROTANOMALY"

                // Llamar al servicio para actualizar el ColorFilter
                val intent = Intent(this, OverlayService::class.java)
                intent.putExtra("toggled", toggled)
                intent.putExtra("adjustment", adjustment)
                intent.putExtra("severity", severity)
                intent.putExtra("type", type)
                startService(intent)

                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}
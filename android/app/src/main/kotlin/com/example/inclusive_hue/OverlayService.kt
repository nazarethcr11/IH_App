package com.example.inclusive_hue

import android.app.Service
import android.content.Intent
import android.graphics.Color
import android.graphics.PorterDuff
import android.graphics.PorterDuffColorFilter
import android.os.IBinder
import android.view.LayoutInflater
import android.view.WindowManager
import android.view.View
import android.widget.LinearLayout
import android.graphics.PixelFormat

class OverlayService : Service() {

    private lateinit var windowManager: WindowManager
    private lateinit var overlayView: View

    override fun onBind(intent: Intent): IBinder? {
        return null
    }

    override fun onCreate() {
        super.onCreate()
        windowManager = getSystemService(WINDOW_SERVICE) as WindowManager

        val layoutInflater = getSystemService(LAYOUT_INFLATER_SERVICE) as LayoutInflater
        overlayView = layoutInflater.inflate(R.layout.overlay_layout, null)

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
            PixelFormat.TRANSLUCENT
        )

        windowManager.addView(overlayView, params)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent != null) {
            val toggled = intent.getBooleanExtra("toggled", false)
            val adjustment = intent.getDoubleExtra("adjustment", 0.0)
            val severity = intent.getDoubleExtra("severity", 0.0)
            val type = intent.getStringExtra("type") ?: "PROTANOMALY"
            applyColorFilter(toggled, adjustment, severity, type)
        }
        return super.onStartCommand(intent, flags, startId)
    }

    private fun applyColorFilter(toggled: Boolean, adjustment: Double, severity: Double, type: String) {
        val linearLayout = overlayView.findViewById<LinearLayout>(R.id.overlay_layout)

        val colorFilter = if (toggled) {
            // Implementa tu lógica para obtener el ColorFilter basado en el tipo, severidad y ajuste
            getColorFilterForTypeAndSeverity(type, severity / 100, adjustment / 100)
        } else {
            null
        }

        linearLayout.background.colorFilter = colorFilter
    }

    private fun getColorFilterForTypeAndSeverity(type: String, severity: Double, adjustment: Double): PorterDuffColorFilter {
        // Dummy example
        return PorterDuffColorFilter(Color.RED, PorterDuff.Mode.SRC_ATOP)
    }

    override fun onDestroy() {
        super.onDestroy()
        if (::overlayView.isInitialized) {
            windowManager.removeView(overlayView)
        }
    }
}
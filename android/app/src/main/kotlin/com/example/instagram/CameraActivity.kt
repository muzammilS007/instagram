package com.example.instagram

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.activity.result.contract.ActivityResultContracts

class CameraActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_camera)
        findViewById<Button>(R.id.button).setOnClickListener {
            val intent = Intent()
            intent.putExtra("path","image/image123")
            setResult(Activity.RESULT_OK,intent)
            finish()
        }
    }
}
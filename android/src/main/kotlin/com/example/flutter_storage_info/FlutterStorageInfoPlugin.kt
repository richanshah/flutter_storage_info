package com.example.flutter_storage_info

import android.app.usage.StorageStatsManager
import android.content.Context
import android.os.Environment
import android.os.storage.StorageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.io.IOException
import kotlin.math.log
import kotlin.math.pow

class FlutterStorageInfoPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "storage_info_data")
    channel.setMethodCallHandler(this)
    context = binding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "getFreeStorageData" -> result.success(getFreeStorageSize())
      "getTotalStorageData" -> result.success(getTotalStorageSize())
      else -> result.notImplemented()
    }
  }

  private fun getFreeStorageSize(): Double {
    val storageManager = context.getSystemService(Context.STORAGE_SERVICE) as StorageManager
    return try {
      val storageStatsManager =
        context.getSystemService(Context.STORAGE_STATS_SERVICE) as StorageStatsManager
      val uuid = storageManager.getUuidForPath(Environment.getDataDirectory())
      val freeBytes = storageStatsManager.getFreeBytes(uuid)
      val sizeRepresentation = StorageUtil.getStorageSizeRepresentation(freeBytes)
      val base = sizeRepresentation.base.toDouble()
      freeBytes / (base * base * base)
    } catch (e: IOException) {
      0.0
    }
  }

  private fun getTotalStorageSize(): Double {
    val storageManager = context.getSystemService(Context.STORAGE_SERVICE) as StorageManager
    return try {
      val storageStatsManager =
        context.getSystemService(Context.STORAGE_STATS_SERVICE) as StorageStatsManager
      val uuid = storageManager.getUuidForPath(Environment.getDataDirectory())
      val totalBytes = storageStatsManager.getTotalBytes(uuid)
      val sizeRepresentation = StorageUtil.getStorageSizeRepresentation(totalBytes)
      val base = sizeRepresentation.base.toDouble()
      totalBytes / (base * base * base)
    } catch (e: IOException) {
      0.0
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

object StorageUtil {
  fun getStorageSizeRepresentation(storageSizeInBytes: Long): SizeRepresentation {
    return if (log(storageSizeInBytes / (1024.0.pow(3)), 2.0) % 1.0 == 0.0) {
      SizeRepresentation.Binary
    } else {
      SizeRepresentation.Decimal
    }
  }
}

enum class SizeRepresentation(val base: Int) {
  Binary(1024), Decimal(1000)
}

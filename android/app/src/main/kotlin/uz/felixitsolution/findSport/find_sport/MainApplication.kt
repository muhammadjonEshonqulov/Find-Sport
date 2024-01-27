package uz.felixitsolution.findSport.find_sport

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
//        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("c64df307-c30d-4d24-a330-659b4a295a47") // Your generated API key
    }
}
# beep_mobile

# add splash screen to android an ios
`flutter pub run flutter_native_splash:create --path=path/to/my/file.yaml `

# add launcher icons
`flutter pub run flutter_launcher_icons:main -f path=path/to/my/file.yaml`

Go to android/app/build.gradle and change the minSdkVersion and targetSdkVersion to integer values.

<code> 
    minSdkVersion 21
    targetSdkVersion 29
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
</code>

Then do the rest, i.e.

<code>   
    pub.get -> flutter pub run flutter_launcher_icons:main
</code>

# translations using get_cli 
<code>
get generate locales .\assets\translations\ on  lib\utils\generated
</code>

# hive generate models 
<code>
flutter packages pub run build_runner build --delete-conflicting-outputs
</code>


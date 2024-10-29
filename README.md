# helloworld

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 问题和技巧
```
1、flutter build apk 一直卡在Running Gradle task 'assembleRelease'... 可以参考以下网站：
https://cloud.tencent.com/developer/article/1747960
2、flutter debug调试可以参考以下网站：
https://blog.csdn.net/shifang07/article/details/92994497
```
# 环境变量
```
Flutter 社区

FLUTTER_STORAGE_BASE_URL: https://storage.flutter-io.cn
PUB_HOSTED_URL: https://pub.flutter-io.cn

flutter依赖包仓库地址
https://pub.flutter-io.cn
```


# 文档
```
官网
https://flutter.cn/docs

实战
https://book.flutterchina.club/

可选组件库
贝壳的：
https://bruno.ke.com/page/
```

# 常用指令
```
检测flutter各项环境
flutter doctor

本地启动指令
flutter run

打包apk包
flutter build apk
flutter build apk --debug


flutter sdk提示不是支持 null safety模式，使用下面的指令
flutter run --no-sound-null-safety
flutter build apk --no-sound-null-safety

```

# lib 文件目录
```
components：公共组件
demo-pages：练习demo案例页面
http：网络请求封装
images: 图片文件 
pages：项目页面
routes：路由注册
utils: 封装工具方法
widget-template：两个widget模板。state-widget.dart 为有改变状态的模板页面的 widget 模板；static-widget.dart 为静态页面的 widget 模板
main.dart：项目入口文件
```

# 使用 image_picker 插件打包时的问题。解决方案见 https://juejin.cn/post/7124980019893370894
```
--------------------------------------------------------------------------------------------------
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:lintVitalRelease'.
> Could not resolve all artifacts for configuration ':image_picker_android:debugUnitTestRuntimeClasspath'.
   > Failed to transform bcprov-jdk15on-1.68.jar (org.bouncycastle:bcprov-jdk15on:1.68) to match attributes {artifactType=processed-jar, org.gradle.category=library, org.gradle.libraryelements=jar, org.gradle.status=release, org.gradle.usage=java-runtime}.
      > Execution failed for JetifyTransform: C:\Users\yanghua\.gradle\caches\modules-2\files-2.1\org.bouncycastle\bcprov-jdk15on\1.68\46a080368d38b428d237a59458f9bc915222894d\bcprov-jdk15on-1.68.jar.
         > Failed to transform 'C:\Users\yanghua\.gradle\caches\modules-2\files-2.1\org.bouncycastle\bcprov-jdk15on\1.68\46a080368d38b428d237a59458f9bc915222894d\bcprov-jdk15on-1.68.jar' using Jetifier. Reason: IllegalArgumentException, message: Unsupported class file major version 59. (Run with --stacktrace for more details.)        
           Suggestions:
            - Check out existing issues at https://issuetracker.google.com/issues?q=componentid:460323&s=modified_time:desc, it's possible that this issue has already been filed there.
            - If this issue has not been filed, please report it at https://issuetracker.google.com/issues/new?component=460323 (run with --stacktrace and provide a stack trace if possible).

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 28s
Running Gradle task 'assembleRelease'...                           29.5s
Gradle task assembleRelease failed with exit code 1
------------------------------------------------------------------------------------------------------
flutter build apk 时一直报上面的错信息；最后解决方案是在  andriod > gradle.properties 文件里加： android.jetifier.blacklist=bcprov-jdk15on  解决
```

# 使用 flutter_blue 插件本地调试时，需要开启电脑的开发者模式
```
https://www.coder.work/article/7765176

window电脑搜索： Developer Mode，将开发者模式调成 开
```
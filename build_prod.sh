#!/bin/bash
# BUILD_APK="flutter clean && flutter build apk --debug && flutter build apk --profile && flutter build apk --release"
BUILD_APK="flutter build apk --release"
APPNAME="SMESP - Limpeza"
DATETIME=$(date +'%Y%m%d%H%M%S')

sed -i '/static final bool flagDev =/c\  static final bool flagDev = false;' lib/utils/app_preferences.utils.dart
sed -i '/static String backEndUrl =/c\    static String backEndUrl = urlProd;' lib/data/provider/api_back.provider.dart


rm -Rf build-all/*

eval $BUILD_APK
cp build/app/outputs/apk/release/app-release.apk "build-all/$APPNAME-v$1.prod.$DATETIME.apk"
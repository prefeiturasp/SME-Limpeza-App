#!/bin/bash
opcoes=("build-apk-dev" "build-apk-prod" "build-apk-dev-prod" "bundle" "gera-as-porra-toda" "build-runner" "build-runner-conflicts" "launcher-icon-splash" "keytool-gradlewSigningReports" "set-developing")

# BUILD_APK="flutter clean && flutter build apk --debug && flutter build apk --profile && flutter build apk --release"
BUILD_APK="flutter build apk --release"
APPNAME="SMESP - Limpeza"

set_datetime() {
    DATETIME=$(date +'%Y%m%d%H%M%S')
}

create_folder_build () {
    rm -rf build-all
    mkdir build-all
}

set_dev() {
    sed -i '/static final bool flagDev =/c\  static final bool flagDev = true;' lib/utils/app_preferences.utils.dart
    sed -i '/static String backEndUrl =/c\    static String backEndUrl = urlLocal;' lib/data/provider/api_back.provider.dart
}

set_prod() {
    sed -i '/static final bool flagDev =/c\  static final bool flagDev = false;' lib/utils/app_preferences.utils.dart
    sed -i '/static String backEndUrl =/c\    static String backEndUrl = urlProd;' lib/data/provider/api_back.provider.dart
}

ask_version () {
    echo "Nome APP: $APPNAME"
    echo "Digite a versão (sem o 'v'):"
    read VERSAO
}

build_dev () {
    set_dev
    eval $BUILD_APK
    cp build/app/outputs/apk/release/app-release.apk "build-all/$APPNAME-v$1.dev.$DATETIME.apk"
}

build_prod() {
    set_prod    
    eval $BUILD_APK
    cp build/app/outputs/apk/release/app-release.apk "build-all/$APPNAME-v$1.prod.$DATETIME.apk"
}

bundle() {
    sed -i '/static final bool flagDev =/c\  static final bool flagDev = false;' lib/utils/app_preferences.utils.dart
    sed -i '/static String backEndUrl =/c\    static String backEndUrl = urlProd;' lib/data/provider/api_back.provider.dart
    flutter build appbundle
    cp build/app/outputs/bundle/release/app-release.aab "build-all/$APPNAME-v$1.bundle.$DATETIME.aab"
}

set_datetime

select opcao in ${opcoes[@]}
do
	case $opcao in 
		build-apk-dev)
            echo "Executando $opcao..."
            create_folder_build
			build_dev
            nautilus build-all
            break
		;;
        build-apk-prod)
            echo "Executando $opcao..."
            create_folder_build
			build_prod
            nautilus build-all
            break
		;;
        build-apk-dev-prod)
            echo "Executando $opcao..."
            create_folder_build
            build_dev
			build_prod
            nautilus build-all
            break
		;;
        bundle)
            echo "Executando $opcao..."
            create_folder_build
			bundle
            nautilus build-all
            break
		;;
        gera-as-porra-toda)
            echo "Executando $opcao..."

            create_folder_build
            ask_version
            
            build_dev "$VERSAO"
            build_prod "$VERSAO"
            bundle "$VERSAO"

            nautilus build-all/
        ;;
        build-runner)
            echo "Executando $opcao..."
            flutter pub run build_runner watch
        ;;
        build-runner-conflicts)
            echo "Executando $opcao..."
            flutter packages pub run build_runner build --delete-conflicting-outputs
        ;;
        launcher-icon-splash)
            echo "Executando $opcao..."
            flutter pub run flutter_launcher_icons:main
            flutter pub run flutter_native_splash:create
        ;;
        keytool-gradlewSigningReports)
            echo "Executando $opcao..."
            cd android && ./gradlew signingReport && cd ..
        ;;
        set-developing)
            echo "Executando $opcao..."
            set_dev
        ;;
		*) echo "Opção Inválida"
		;;
	esac
done

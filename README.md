# sme_prefeitura_sao_paulo_app

## Pré-requisitos

- Flutter 2.10.5 instalado e configurado
- Android Studio Otter 2 Feature Drop 2025.2.2 instalado
- Dispositivo Android físico com depuração USB habilitada (recomendado)

## Configurando o ambiente

**1. Instalar o Flutter**

Siga o guia oficial em https://docs.flutter.dev/get-started/install escolhendo a plataforma Windows.

**2. Instalar o Android Studio**

Baixe e instale o Android Studio Otter 2 Feature Drop 2025.2.2 em https://developer.android.com/studio.

**3. Verificar o ambiente**

```bash
flutter doctor
```

Certifique-se de que não há erros críticos antes de continuar.

**4. Clonar o repositório**

```bash
git clone <url-do-repositorio>
cd sme_prefeitura_sao_paulo_app
```

**5. Instalar as dependências**

```bash
flutter pub get
```

## Executando o projeto

**Modo debug (recomenda-se dispositivo físico)**

Conecte o dispositivo via USB com depuração USB habilitada e confirme a permissão no dispositivo quando solicitado. Verifique se o Flutter reconhece o dispositivo:

```bash
flutter devices
```

Em seguida execute:

```bash
flutter run
```

**Modo release**

```bash
flutter run --release
```

## Gerando o APK

```bash
flutter build apk --release
```

O arquivo gerado estará em `build/app/outputs/flutter-apk/app-release.apk`.

## Observações

- Não utilize emuladores x86_64 no modo debug com esta versão do Flutter, pois há um crash conhecido do JIT compiler com Flutter 2.16.2 nessa configuração. Use sempre um dispositivo físico para depuração.
- O app consome a API de produção em `https://limpeza.sme.prefeitura.sp.gov.br/api/app`.
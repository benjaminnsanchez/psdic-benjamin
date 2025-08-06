
@echo off
setlocal enabledelayedexpansion

rem Crear directorios si no existen
if not exist bin mkdir bin
if not exist lib mkdir lib
if not exist tools mkdir tools

rem Verificar si curl está disponible
where curl >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo curl no está instalado. Descargando curl para Windows...

    set CURL_ZIP_URL=https://curl.se/windows/dl-8.7.1_2/curl-8.7.1_2-win64-mingw.zip
    set CURL_ZIP=curl.zip
    set CURL_DIR=tools\curl
    set CURL_EXE=%CURL_DIR%\curl-8.7.1_2-win64-mingw\bin\curl.exe

    if not exist %CURL_ZIP% (
        powershell -Command "Invoke-WebRequest '%CURL_ZIP_URL%' -OutFile '%CURL_ZIP%'"
        if %ERRORLEVEL% NEQ 0 (
            echo Error descargando curl.zip
            exit /b 1
        )
    )

    powershell -Command "Expand-Archive -Path '%CURL_ZIP%' -DestinationPath '%CURL_DIR%' -Force"
    if %ERRORLEVEL% NEQ 0 (
        echo Error extrayendo curl.zip
        exit /b 1
    )
) else (
    set CURL_EXE=curl
)

rem Crear archivo temporal con dependencias
set DEPS_FILE=dependencies.txt
> %DEPS_FILE% (
    echo org/jetbrains/kotlin/kotlin-stdlib/1.4.32/kotlin-stdlib-1.4.32.jar
    echo org/jetbrains/kotlin/kotlin-stdlib-common/1.4.32/kotlin-stdlib-common-1.4.32.jar
    echo org/jetbrains/annotations/13.0/annotations-13.0.jar
    echo javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar
    echo org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar
    echo org/slf4j/slf4j-simple/1.7.30/slf4j-simple-1.7.30.jar
    echo org/eclipse/jetty/jetty-server/9.4.40.v20210413/jetty-server-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-http/9.4.40.v20210413/jetty-http-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-io/9.4.40.v20210413/jetty-io-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-util/9.4.40.v20210413/jetty-util-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-webapp/9.4.40.v20210413/jetty-webapp-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-servlet/9.4.40.v20210413/jetty-servlet-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-security/9.4.40.v20210413/jetty-security-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-util-ajax/9.4.40.v20210413/jetty-util-ajax-9.4.40.v20210413.jar
    echo org/eclipse/jetty/jetty-xml/9.4.40.v20210413/jetty-xml-9.4.40.v20210413.jar
    echo org/eclipse/jetty/websocket/websocket-api/9.4.40.v20210413/websocket-api-9.4.40.v20210413.jar
    echo org/eclipse/jetty/websocket/websocket-client/9.4.40.v20210413/websocket-client-9.4.40.v20210413.jar
    echo org/eclipse/jetty/websocket/websocket-common/9.4.40.v20210413/websocket-common-9.4.40.v20210413.jar
    echo org/eclipse/jetty/websocket/websocket-server/9.4.40.v20210413/websocket-server-9.4.40.v20210413.jar
    echo org/eclipse/jetty/websocket/websocket-servlet/9.4.40.v20210413/websocket-servlet-9.4.40.v20210413.jar
    echo io/javalin/javalin/3.13.13/javalin-3.13.13.jar
    echo com/fasterxml/jackson/core/jackson-databind/2.10.5/jackson-databind-2.10.5.jar
    echo com/fasterxml/jackson/core/jackson-core/2.10.5/jackson-core-2.10.5.jar
    echo com/fasterxml/jackson/core/jackson-annotations/2.10.5/jackson-annotations-2.10.5.jar
    echo com/konghq/unirest-java/3.13.0/unirest-java-3.13.0.jar
    echo org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar
    echo org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar
    echo org/apache/httpcomponents/httpmime/4.5.13/httpmime-4.5.13.jar
    echo commons-codec/commons-codec/1.15/commons-codec-1.15.jar
    echo commons-logging/commons-logging/1.2/commons-logging-1.2.jar
    echo org/apache/httpcomponents/httpasyncclient/4.1.4/httpasyncclient-4.1.4.jar
    echo org/apache/httpcomponents/httpcore-nio/4.4.13/httpcore-nio-4.4.13.jar
)

echo === Verificando dependencias ===
set /a existing=0
set /a missing=0

for /f "usebackq delims=" %%D in (%DEPS_FILE%) do (
    set "FILENAME=%%~nxD"
    if exist "lib\!FILENAME!" (
        set /a existing+=1
    ) else (
        set /a missing+=1
        echo Descargando !FILENAME!
        "%CURL_EXE%" -s -L "https://repo1.maven.org/maven2/%%D" -o "lib\!FILENAME!"
        if not exist "lib\!FILENAME!" (
            echo Error al descargar !FILENAME!
            exit /b 1
        )
    )
)

set /a total=existing+missing
echo Dependencias: %existing% existentes, %missing% descargadas, %total% total

echo === Compilando ===
javac -cp ".;lib\*" -d bin src\Main.java
if errorlevel 1 (
    echo Error al compilar el código Java.
    exit /b 1
)

echo === Ejecutando ===
java -cp ".;lib\*;bin" Main

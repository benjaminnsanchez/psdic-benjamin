@echo off
setlocal enabledelayedexpansion

rem Crear directorios si no existen
if not exist bin mkdir bin
if not exist lib mkdir lib

rem Definir las dependencias necesarias
set DEPENDENCIAS=^
"org/jetbrains/kotlin/kotlin-stdlib/1.4.32/kotlin-stdlib-1.4.32.jar"^
 "org/jetbrains/kotlin/kotlin-stdlib-common/1.4.32/kotlin-stdlib-common-1.4.32.jar"^
 "org/jetbrains/annotations/13.0/annotations-13.0.jar"^
 "javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar"^
 "org/slf4j/slf4j-api/1.7.30/slf4j-api-1.7.30.jar"^
 "org/slf4j/slf4j-simple/1.7.30/slf4j-simple-1.7.30.jar"^
 "org/eclipse/jetty/jetty-server/9.4.40.v20210413/jetty-server-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-http/9.4.40.v20210413/jetty-http-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-io/9.4.40.v20210413/jetty-io-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-util/9.4.40.v20210413/jetty-util-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-webapp/9.4.40.v20210413/jetty-webapp-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-servlet/9.4.40.v20210413/jetty-servlet-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-security/9.4.40.v20210413/jetty-security-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-util-ajax/9.4.40.v20210413/jetty-util-ajax-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/jetty-xml/9.4.40.v20210413/jetty-xml-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/websocket/websocket-api/9.4.40.v20210413/websocket-api-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/websocket/websocket-client/9.4.40.v20210413/websocket-client-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/websocket/websocket-common/9.4.40.v20210413/websocket-common-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/websocket/websocket-server/9.4.40.v20210413/websocket-server-9.4.40.v20210413.jar"^
 "org/eclipse/jetty/websocket/websocket-servlet/9.4.40.v20210413/websocket-servlet-9.4.40.v20210413.jar"^
 "io/javalin/javalin/3.13.13/javalin-3.13.13.jar"^
 "com/fasterxml/jackson/core/jackson-databind/2.10.5/jackson-databind-2.10.5.jar"^
 "com/fasterxml/jackson/core/jackson-core/2.10.5/jackson-core-2.10.5.jar"^
 "com/fasterxml/jackson/core/jackson-annotations/2.10.5/jackson-annotations-2.10.5.jar"^
 "com/konghq/unirest-java/3.13.0/unirest-java-3.13.0.jar"^
 "org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar"^
 "org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar"^
 "org/apache/httpcomponents/httpmime/4.5.13/httpmime-4.5.13.jar"^
 "commons-codec/commons-codec/1.15/commons-codec-1.15.jar"^
 "commons-logging/commons-logging/1.2/commons-logging-1.2.jar"^
 "org/apache/httpcomponents/httpasyncclient/4.1.4/httpasyncclient-4.1.4.jar"^
 "org/apache/httpcomponents/httpcore-nio/4.4.13/httpcore-nio-4.4.13.jar"

echo === Verificando dependencias ===
set /a existing=0
set /a missing=0

for %%D in (%DEPENDENCIAS%) do (
    for %%I in ("%%~nxD") do (
        if exist "lib\%%~nxI" (
            set /a existing+=1
        ) else (
            set /a missing+=1
            echo Descargando %%~nxI
            curl -s -L "https://repo1.maven.org/maven2/%%D" -o "lib\%%~nxI"
            if not exist "lib\%%~nxI" (
                echo Error al descargar %%~nxI
                exit /b 1
            )
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

@echo off
REM Limpiar y crear directorios
if exist lib ( 
    del /Q lib\*.jar 
) else ( 
    mkdir lib 
)
if not exist bin ( 
    mkdir bin 
)

REM Lista de dependencias - una por línea para mejor legibilidad
setlocal enabledelayedexpansion

echo === Descargando dependencias ===

REM Kotlin dependencies
call :download_jar "org/jetbrains/kotlin/kotlin-stdlib/1.4.32" "kotlin-stdlib-1.4.32.jar"
call :download_jar "org/jetbrains/kotlin/kotlin-stdlib-common/1.4.32" "kotlin-stdlib-common-1.4.32.jar"
call :download_jar "org/jetbrains/annotations/13.0" "annotations-13.0.jar"

REM Servlet API
call :download_jar "javax/servlet/javax.servlet-api/3.1.0" "javax.servlet-api-3.1.0.jar"

REM SLF4J
call :download_jar "org/slf4j/slf4j-api/1.7.30" "slf4j-api-1.7.30.jar"
call :download_jar "org/slf4j/slf4j-simple/1.7.30" "slf4j-simple-1.7.30.jar"

REM Jetty dependencies
call :download_jar "org/eclipse/jetty/jetty-server/9.4.40.v20210413" "jetty-server-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-http/9.4.40.v20210413" "jetty-http-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-io/9.4.40.v20210413" "jetty-io-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-util/9.4.40.v20210413" "jetty-util-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-webapp/9.4.40.v20210413" "jetty-webapp-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-servlet/9.4.40.v20210413" "jetty-servlet-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-security/9.4.40.v20210413" "jetty-security-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-util-ajax/9.4.40.v20210413" "jetty-util-ajax-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/jetty-xml/9.4.40.v20210413" "jetty-xml-9.4.40.v20210413.jar"

REM WebSocket dependencies
call :download_jar "org/eclipse/jetty/websocket/websocket-api/9.4.40.v20210413" "websocket-api-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/websocket/websocket-client/9.4.40.v20210413" "websocket-client-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/websocket/websocket-common/9.4.40.v20210413" "websocket-common-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/websocket/websocket-server/9.4.40.v20210413" "websocket-server-9.4.40.v20210413.jar"
call :download_jar "org/eclipse/jetty/websocket/websocket-servlet/9.4.40.v20210413" "websocket-servlet-9.4.40.v20210413.jar"

REM Javalin - LA DEPENDENCIA PRINCIPAL
call :download_jar "io/javalin/javalin/3.13.13" "javalin-3.13.13.jar"

REM Jackson dependencies
call :download_jar "com/fasterxml/jackson/core/jackson-databind/2.10.5" "jackson-databind-2.10.5.jar"
call :download_jar "com/fasterxml/jackson/core/jackson-core/2.10.5" "jackson-core-2.10.5.jar"
call :download_jar "com/fasterxml/jackson/core/jackson-annotations/2.10.5" "jackson-annotations-2.10.5.jar"

echo === Verificando descargas ===
dir lib\*.jar

echo === Compilando ===
javac -cp ".;lib\*" -d bin src\*.java
if errorlevel 1 (
    echo Error al compilar el codigo Java.
    pause
    exit /b 1
)

echo === Ejecutando ===
java -cp ".;lib\*;bin" Main
goto :eof

:download_jar
set "path_jar=%~1"
set "filename=%~2"
set "url=https://repo1.maven.org/maven2/%path_jar%/%filename%"

if not exist "lib\%filename%" (
    echo Descargando %filename%...
    curl -s -L "%url%" -o "lib\%filename%"
    if not exist "lib\%filename%" (
        echo ERROR: No se pudo descargar %filename%
        echo URL intentada: %url%
    ) else (
        echo OK: %filename% descargado
    )
) else (
    echo Ya existe: %filename%
)
goto :eof
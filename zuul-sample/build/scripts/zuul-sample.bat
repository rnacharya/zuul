@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  zuul-sample startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and ZUUL_SAMPLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS="-DTZ=GMT" "-Darchaius.deployment.environment=test" "-Dcom.sun.management.jmxremote" "-Dcom.sun.management.jmxremote.local.only=false" "-Deureka.validateInstanceId=false" "-Deureka.mt.num_retries=1"

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\zuul-sample-2.1.8-SNAPSHOT.jar;%APP_HOME%\lib\zuul-groovy-2.1.8-SNAPSHOT.jar;%APP_HOME%\lib\zuul-guice-2.1.8-SNAPSHOT.jar;%APP_HOME%\lib\zuul-core-2.1.8-SNAPSHOT.jar;%APP_HOME%\lib\ribbon-eureka-2.7.17.jar;%APP_HOME%\lib\eureka-client-1.9.18.jar;%APP_HOME%\lib\ribbon-archaius-2.7.17.jar;%APP_HOME%\lib\netflix-eventbus-0.3.0.jar;%APP_HOME%\lib\archaius-core-0.7.6.jar;%APP_HOME%\lib\commons-configuration-1.8.jar;%APP_HOME%\lib\governator-core-1.17.10.jar;%APP_HOME%\lib\log4j-slf4j-impl-2.13.1.jar;%APP_HOME%\lib\log4j-core-2.13.1.jar;%APP_HOME%\lib\ribbon-httpclient-2.7.17.jar;%APP_HOME%\lib\ribbon-loadbalancer-2.7.17.jar;%APP_HOME%\lib\servo-core-0.12.21.jar;%APP_HOME%\lib\spectator-api-0.103.0.jar;%APP_HOME%\lib\netflix-commons-util-0.3.0.jar;%APP_HOME%\lib\ribbon-core-2.7.17.jar;%APP_HOME%\lib\netflix-statistics-0.1.1.jar;%APP_HOME%\lib\netflix-infix-0.3.0.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\jackson-databind-2.9.8.jar;%APP_HOME%\lib\rxjava-1.2.1.jar;%APP_HOME%\lib\netty-codec-http2-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.50.Final.jar;%APP_HOME%\lib\netty-handler-4.1.50.Final.jar;%APP_HOME%\lib\netty-codec-haproxy-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.50.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.50.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-codec-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.50.Final.jar;%APP_HOME%\lib\netty-transport-4.1.50.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.50.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.50.Final.jar;%APP_HOME%\lib\netty-common-4.1.50.Final.jar;%APP_HOME%\lib\guice-grapher-4.1.0.jar;%APP_HOME%\lib\guice-multibindings-4.1.0.jar;%APP_HOME%\lib\guice-assistedinject-4.1.0.jar;%APP_HOME%\lib\guice-4.2.3-no_aop.jar;%APP_HOME%\lib\guice-4.2.3.jar;%APP_HOME%\lib\guava-29.0-jre.jar;%APP_HOME%\lib\bcprov-jdk15on-1.65.jar;%APP_HOME%\lib\jackson-core-2.9.8.jar;%APP_HOME%\lib\perfmark-api-0.21.0.jar;%APP_HOME%\lib\governator-api-1.17.10.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.30.Final.jar;%APP_HOME%\lib\jettison-1.3.7.jar;%APP_HOME%\lib\xstream-1.4.11.1.jar;%APP_HOME%\lib\jersey-apache-client4-1.19.1.jar;%APP_HOME%\lib\jersey-client-1.19.1.jar;%APP_HOME%\lib\jersey-core-1.19.1.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\httpclient-4.5.3.jar;%APP_HOME%\lib\compactmap-1.2.1.jar;%APP_HOME%\lib\jackson-annotations-2.9.4.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\log4j-api-2.13.1.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\annotations-2.0.0.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-qual-2.11.1.jar;%APP_HOME%\lib\error_prone_annotations-2.3.4.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\groovy-ant-3.0.3.jar;%APP_HOME%\lib\groovy-astbuilder-3.0.3.jar;%APP_HOME%\lib\groovy-cli-picocli-3.0.3.jar;%APP_HOME%\lib\groovy-groovysh-3.0.3.jar;%APP_HOME%\lib\groovy-console-3.0.3.jar;%APP_HOME%\lib\groovy-datetime-3.0.3.jar;%APP_HOME%\lib\groovy-groovydoc-3.0.3.jar;%APP_HOME%\lib\groovy-docgenerator-3.0.3.jar;%APP_HOME%\lib\groovy-jmx-3.0.3.jar;%APP_HOME%\lib\groovy-json-3.0.3.jar;%APP_HOME%\lib\groovy-jsr223-3.0.3.jar;%APP_HOME%\lib\groovy-macro-3.0.3.jar;%APP_HOME%\lib\groovy-nio-3.0.3.jar;%APP_HOME%\lib\groovy-servlet-3.0.3.jar;%APP_HOME%\lib\groovy-sql-3.0.3.jar;%APP_HOME%\lib\groovy-swing-3.0.3.jar;%APP_HOME%\lib\groovy-templates-3.0.3.jar;%APP_HOME%\lib\groovy-test-3.0.3.jar;%APP_HOME%\lib\groovy-test-junit5-3.0.3.jar;%APP_HOME%\lib\groovy-testng-3.0.3.jar;%APP_HOME%\lib\groovy-xml-3.0.3.jar;%APP_HOME%\lib\groovy-3.0.3.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\commons-math-2.2.jar;%APP_HOME%\lib\xmlpull-1.1.3.1.jar;%APP_HOME%\lib\xpp3_min-1.1.4c.jar;%APP_HOME%\lib\httpcore-4.4.6.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\dexx-collections-0.2.jar;%APP_HOME%\lib\ant-junit-1.10.7.jar;%APP_HOME%\lib\ant-1.10.7.jar;%APP_HOME%\lib\ant-launcher-1.10.7.jar;%APP_HOME%\lib\ant-antlr-1.10.7.jar;%APP_HOME%\lib\picocli-4.2.0.jar;%APP_HOME%\lib\qdox-1.12.1.jar;%APP_HOME%\lib\javaparser-core-3.15.17.jar;%APP_HOME%\lib\jline-2.14.6.jar;%APP_HOME%\lib\junit-4.13.jar;%APP_HOME%\lib\junit-jupiter-engine-5.6.0.jar;%APP_HOME%\lib\junit-platform-engine-1.6.0.jar;%APP_HOME%\lib\junit-jupiter-api-5.6.0.jar;%APP_HOME%\lib\junit-platform-commons-1.6.0.jar;%APP_HOME%\lib\junit-platform-launcher-1.6.0.jar;%APP_HOME%\lib\testng-6.14.3.jar;%APP_HOME%\lib\commons-jxpath-1.3.jar;%APP_HOME%\lib\joda-time-2.3.jar;%APP_HOME%\lib\servlet-api-2.5.jar;%APP_HOME%\lib\antlr-runtime-3.4.jar;%APP_HOME%\lib\gson-2.1.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\opentest4j-1.2.0.jar


@rem Execute zuul-sample
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %ZUUL_SAMPLE_OPTS%  -classpath "%CLASSPATH%" com.netflix.zuul.sample.Bootstrap %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable ZUUL_SAMPLE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%ZUUL_SAMPLE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega

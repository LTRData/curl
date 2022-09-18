setlocal
pushd "%~dp0"
set LIB=%LIB%;C:\Users\olof.OLOFDOM\Source\libyal\libewf\msvscpp\ARM64\Release
set INCLUDE=%INCLUDE%;C:\Users\olof.OLOFDOM\Source\libyal\zlib
nmake /f Makefile.vc mode=dll VC=14 WITH_ZLIB=dll ENABLE_WINSSL=yes MACHINE=ARM64 || goto :eof
signtool sign /a /as /v /n "Lagerkvist Teknisk R†dgivning i Bor†s HB" /du "http://www.ltr-data.se" /ac "z:\kod\cert\GlobalSign Root CA.crt" /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" ..\builds\libcurl-vc14-ARM64-release-dll-zlib-dll-ipv6-sspi-schannel\bin\* || goto :eof
xcopy /d/u/y ..\builds\libcurl-vc14-ARM64-release-dll-zlib-dll-ipv6-sspi-schannel\bin\* P:\UtilsARM64\
popd
endlocal
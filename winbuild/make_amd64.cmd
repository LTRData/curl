setlocal
pushd "%~dp0"
set CC=cl.exe /D_WIN32_WINNT=0x0502
set X_LFLAGS=BufferoverflowU.lib
set LIB=%LIB%;C:\Users\olof.OLOFDOM\Source\libyal\libewf\msvscpp\x64\Release
set INCLUDE=%INCLUDE%;C:\Users\olof.OLOFDOM\Source\libyal\zlib
nmake /f Makefile.vc mode=dll VC=8 WITH_ZLIB=dll ENABLE_IDN=no ENABLE_WINSSL=yes MACHINE=AMD64 || goto :eof
"C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool.exe" sign /a /as /v /n "Lagerkvist Teknisk R†dgivning i Bor†s HB" /du "http://www.ltr-data.se" /ac "z:\kod\cert\GlobalSign Root CA.crt" /tr "http://sha256timestamp.ws.symantec.com/sha256/timestamp" ..\builds\libcurl-vc8-AMD64-release-dll-zlib-dll-ipv6-sspi-schannel\bin\* || goto :eof
xcopy /d/u/y ..\builds\libcurl-vc8-AMD64-release-dll-zlib-dll-ipv6-sspi-schannel\bin\* P:\Utils64\
popd
endlocal

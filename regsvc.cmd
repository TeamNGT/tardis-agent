@echo off
@rem ------------------------------------------------------------------------------------------
@rem  Tardis Agent Service 등록 for Windows
@rem   . Command 실행 시 관리자 권한으로 실행 하여야 한다.
@rem   . Command 실행 후 services.msc 실행, tardis-agent 서비스 시작을 한다.
@rem ------------------------------------------------------------------------------------------

@rem === instsrv.exe와 srvany.exe 파일을 실행 시킬 디렉토리에 둔다. ===
instsrv.exe tardis-agent %CD%\srvany.exe

@rem === Tardis Agent 실행 Command를 등록 한다. ===
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "Application" /t REG_SZ /d "D:\tardis-agent\start.cmd" /f

@rem === Tardis Agent 실행 Command 디렉토리를 등록한다. ===
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "AppDirectory" /t REG_SZ /d "D:\tardis-agent" /f

@rem === Default Value ===
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "AppParameters" /t REG_SZ /d "" /f
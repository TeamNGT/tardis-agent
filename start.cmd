@echo off
@rem ------------------------------------------------------------------------------------------
@rem  Tardis Agent Start Command for Windows
@rem ------------------------------------------------------------------------------------------

@rem === JAVA Home Directory ===
set JAVA_HOME=D:\Java\jdk8

rmdir /q /s public
mkdir public

echo Start Tardis Agent
if exist tardis-agent.pid (
	set /p PID=<tardis-agent.pid
	taskkill /f /pid %PID%
)
::java.exe -jar .\tardis-agent-0.9.7.2.jar --spring.config.location=classpath:/application.properties,file:./tardis-agent.properties > tardis-agent.log
java.exe -jar .\tardis-agent-0.9.7.2.jar --spring.config.location=classpath:/application.properties,file:./tardis-agent.properties
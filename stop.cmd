@echo off
@rem ------------------------------------------------------------------------------------------
@rem  Tardis Agent Stop Command for Windows
@rem ------------------------------------------------------------------------------------------
set /p PID=<tardis-agent.pid
echo Stop Tardis Agent
taskkill /f /pid %PID%
del tardis-agent.pid
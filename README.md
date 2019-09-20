# Tardis Agent

- Download

  아래 다운로드 링크에서 jar 파일을 다운로드 받는다.

  [다운로드](http://github.nhnent.com/tardis/agent/raw/master/0.0.1/tardis-agent-0.0.1.jar)

- 환경 설정

  tardis-agent.properties 파일을 실행 환경에 맞게 세팅 한다.

  ```properties
  # Agent Port
  server.port=18080
  
  # Tardis Management
  tardis.management.url=http://127.0.0.1:25150
  ```

- Start Shell (Command) 을 실행 환경에 맞게 세팅 한다

  - Unix (start.sh)

    ```bash
    #!/bin/sh
    # Start Command (ex. nohup java -jar [tardis-agent jar] --spring.config.location=[CONFIG_FILE]
    nohup $JAVA_HOME/bin/java -jar ./0.0.1/tardis-agent*.jar --spring.config.location=classpath:/application.properties,file:./tardis-agent.properties
    ```

  * Windows (start.cmd)

    ```powershell
    @echo off
    @rem ----------------------------------------
    @rem  Tardis Agent Start Command for Windows
    @rem ----------------------------------------
    
    @rem === JAVA Home Directory 설정 ===
    set JAVA_HOME=D:\Java\jdk8
    echo Start Tardis Agent
    %JAVA_HOME%\bin\java.exe -jar .\0.0.1\tardis-agent-0.0.1.jar --spring.config.location=classpath:/application.properties,file:./tardis-agent.properties > tardis-agent.log
    ```

- 서비스 등록

  - Unix

    ```bash
    $ sudo vi /usr/lib/systemd/system/tardis-agent.service
    ```

    ```properties
    [Unit]
    Description=Tardis Agent
    
    [Service]
    Type=forking
    # JAVA_HOME
    Environment=JAVA_HOME=/opt/jdk8
    # Tardis Admin Home
    WorkingDirectory=/home/tardis/tardis-agent
    User=tardis
    Group=tardis
      
    # Sets open_files_limit
    LimitNOFILE=65535
    
    ExecStart=/home/tardis/tardis-agent/start.sh
    ExecStop=/home/tardis/tardis-agent/stop.sh
    
    [Install]
    WantedBy=multi-user.target
    ```

    ```bash
    $ sudo systemctl enable tardis-agent.service
    ```

  - Windows

    `regsvc.cmd`
    
    ```powershell
    @echo off
    @rem -----------------------------------------------------------------------------
    @rem  Tardis Agent Service 등록 for Windows
    @rem   . Command 실행 시 관리자 권한으로 실행 하여야 한다.
    @rem   . Command 실행 후 services.msc 실행, tardis-agent 서비스 시작을 한다.
    @rem -----------------------------------------------------------------------------
    
    @rem === instsrv.exe와 srvany.exe 파일을 실행 시킬 디렉토리에 둔다. ===
    instsrv.exe tardis-agent %CD%\srvany.exe
    
    @rem === Tardis Agent 실행 Command를 등록 한다. ===
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "Application" /t REG_SZ /d "D:\tardis-agent\start.cmd" /f
    
    @rem === Tardis Agent 실행 Command 디렉토리를 등록한다. ===
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "AppDirectory" /t REG_SZ /d "D:\tardis-agent" /f
    
    @rem === Default Value ===
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tardis-agent\Parameters" /v "AppParameters" /t REG_SZ /d "" /f
    ```
    
    `관리자 권한으로 실행`
    
    ```powershell
    D:\tardis-agent> regsvc.cmd
    ```

- 실행

  - Unix

    ```bash
    $ sudo systemctl start tardis-agent.service
    ```

  * Windows

    ```powershell
    D:\tardis-agent> start.cmd
    ```
    
    OR
    
    services.msc 실행 후 tardis-agent 시작

- 중지

  - Unix

    ```bash
    $ sudo systemctl stop tardis-agent.service
    ```

  - Windows

    ```powershell
    D:\tardis-agent> stop.cmd
    ```

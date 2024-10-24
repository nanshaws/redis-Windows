@echo off

REM 获取当前目录路径
set CURRENT_DIR=%cd%

REM 启动当前目录下的 redis-cli.exe
start "" "%CURRENT_DIR%\redis-cli.exe"
echo redis-cli started.
REM 为了确保 redis-server 启动前，redis-cli 已经完全启动，等待一段时间
timeout /t 2 /nobreak >nul

REM 启动当前目录下的 redis-server.exe
start "" "%CURRENT_DIR%\redis-server.exe"
echo redis-server started.

REM 等待一段时间，以便服务启动并准备就绪
timeout /t 1 /nobreak >nul

REM 关闭当前目录下的 redis-cli.exe
taskkill /F /IM redis-cli.exe
echo redis-cli closed.

pause
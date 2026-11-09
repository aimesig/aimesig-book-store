@echo off
cd /d "%~dp0"
py -m http.server 8000
if errorlevel 1 python -m http.server 8000

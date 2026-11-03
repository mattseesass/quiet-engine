@echo off
rem Opens Quiet Engine through a tiny server on this PC (http://localhost:5180) so the YouTube player works.
start "Quiet Engine" /min powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"

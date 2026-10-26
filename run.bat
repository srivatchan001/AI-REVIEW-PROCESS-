@echo off
title RecruitAI - System Launcher (Zero Node.js Required)
echo ======================================================================
echo   RecruitAI - AI-Powered Recruitment Task Management System
echo   Embedded Architecture: FastAPI + Built-in React SPA + Code Sandbox
echo   Zero Node.js runtime required!
echo ======================================================================
echo.
cd /d "%~dp0backend"

if not exist ".venv\Scripts\python.exe" (
    echo [1/3] Python virtual environment not found. Creating .venv...
    py -3.13 -m venv .venv 2>nul || py -3 -m venv .venv 2>nul || python -m venv .venv
    echo [2/3] Installing dependencies...
    .\.venv\Scripts\pip.exe install -r requirements.txt
    echo [3/3] Initializing and seeding database...
    .\.venv\Scripts\python.exe -m app.seed_data
)

echo.
echo ======================================================================
echo   RecruitAI is ready!
echo   Web Application UI: http://127.0.0.1:8000
echo   Interactive API:    http://127.0.0.1:8000/docs
echo   Demo Admin Login:   admin@demo.com / admin123
echo ======================================================================
echo.
echo Launching your browser to http://127.0.0.1:8000 ...
start http://127.0.0.1:8000
.\.venv\Scripts\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8000
pause

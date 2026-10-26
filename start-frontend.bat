@echo off
title RecruitAI Frontend Server
echo Starting React Vite Frontend on http://localhost:3000 ...
cd /d "%~dp0frontend"
if not exist "node_modules" (
    echo node_modules not found. Running npm install...
    call npm install
)
call npm run dev
pause

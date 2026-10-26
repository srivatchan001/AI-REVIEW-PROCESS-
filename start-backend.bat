@echo off
title RecruitAI Backend Server
echo Starting FastAPI Backend on http://localhost:8000 ...
cd /d "%~dp0backend"
if not exist ".venv\Scripts\python.exe" (
    echo Python virtual environment not found. Creating .venv...
    python -m venv .venv
    .\.venv\Scripts\pip.exe install -r requirements.txt
    .\.venv\Scripts\python.exe -m app.seed_data
)
.\.venv\Scripts\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
pause

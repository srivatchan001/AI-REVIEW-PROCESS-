@echo off
title Push to GitHub - RecruitAI
echo ======================================================================
echo   RecruitAI - GitHub Push Assistant
echo ======================================================================
echo.

cd /d "%~dp0"

echo [1/3] Checking Git status...
git status --short
echo.

set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/repo.git): "

if "%REPO_URL%"=="" (
    echo [ERROR] No URL provided. Exiting.
    pause
    exit /b 1
)

echo.
echo [2/3] Configuring remote origin...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main

echo [3/3] Pushing to GitHub (main branch)...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ======================================================================
    echo   SUCCESS! Your project has been uploaded to GitHub!
    echo   Repository URL: %REPO_URL%
    echo ======================================================================
) else (
    echo.
    echo ======================================================================
    echo   Push encountered an error. Please check your credentials or URL.
    echo ======================================================================
)

pause

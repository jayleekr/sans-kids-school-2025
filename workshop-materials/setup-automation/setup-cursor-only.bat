@echo off
chcp 65001 >nul 2>&1

echo.
echo =====================================================
echo    ⚙️  Cursor 설정 파일 생성 (Windows CMD)
echo =====================================================
echo.

:: 1. 프로젝트 디렉토리 설정
echo [1/3] 📁 프로젝트 디렉토리 설정...
cd /d "%~dp0"
cd ..\..
set PROJECT_DIR=%CD%
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%

:: 2. .cursor 디렉토리 생성
echo.
echo [2/3] 📁 .cursor 디렉토리 생성...
if not exist ".cursor" (
    mkdir .cursor
    echo ✅ .cursor 디렉토리 생성 완료!
) else (
    echo ✅ .cursor 디렉토리가 이미 존재합니다!
)

:: 3. MCP 설정 파일 생성
echo.
echo [3/3] ⚙️  MCP 설정 파일 생성...
(
echo {
echo   "mcpServers": {
echo     "playwright": {
echo       "command": "npx",
echo       "args": [
echo         "@playwright/mcp@latest"
echo       ]
echo     }
echo   }
echo }
) > .cursor\mcp.json

if exist ".cursor\mcp.json" (
    echo ✅ MCP 설정 파일 생성 완료!
) else (
    echo ❌ MCP 설정 파일 생성 실패!
    pause
    exit /b 1
)

:: 4. .cursor\rules 디렉토리 생성
echo.
echo [4/4] 📋 Cursor Rules 설정...
if not exist ".cursor\rules" (
    mkdir .cursor\rules
    echo ✅ .cursor\rules 디렉토리 생성 완료!
) else (
    echo ✅ .cursor\rules 디렉토리가 이미 존재합니다!
)

:: 5. .cursorrules 파일 복사 (있는 경우)
if exist ".cursorrules" (
    copy .cursorrules .cursor\rules\base_rule.mdc >nul 2>&1
    if exist ".cursor\rules\base_rule.mdc" (
        echo ✅ Cursor Rules 복사 완료!
    ) else (
        echo ❌ Cursor Rules 복사 실패!
    )
) else (
    echo ⚠️  .cursorrules 파일을 찾을 수 없습니다.
)

:: 완료 메시지
echo.
echo =====================================================
echo    ✅ Cursor 설정 완료!
echo =====================================================
echo.
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%
echo ⚙️  MCP 설정: %PROJECT_DIR%\.cursor\mcp.json
echo 📋 Cursor Rules: %PROJECT_DIR%\.cursor\rules\base_rule.mdc
echo.
echo 🚀 다음 단계:
echo    1. Cursor에서 프로젝트 폴더 열기
echo    2. Ctrl+Shift+P → "MCP: Open Browser" 사용!
echo.
pause 
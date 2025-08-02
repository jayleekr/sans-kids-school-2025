@echo off
chcp 65001 >nul
echo.
echo =====================================================
echo    🎮 VibeCoding 워크숍 환경 자동 설정 (Windows)
echo =====================================================
echo.

:: 관리자 권한 체크
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ 관리자 권한으로 실행 중...
) else (
    echo ❌ 관리자 권한이 필요합니다!
    echo    이 파일을 마우스 오른쪽 클릭 → "관리자 권한으로 실행"
    pause
    exit
)

:: 1. 프로젝트 디렉토리 설정
echo.
echo [1/6] 📁 프로젝트 디렉토리 설정 중...
:: 스크립트가 있는 디렉토리로 이동 (프로젝트 루트)
cd /d "%~dp0"
cd ..\..
set PROJECT_DIR=%CD%
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%
echo ✅ 디렉토리 설정 완료!

:: 2. Cursor 설치 확인
echo.
echo [2/6] 🔍 Cursor 설치 확인 중...
where cursor >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Cursor가 설치되어 있습니다!
) else (
    echo ⚠️  Cursor가 설치되지 않았습니다.
    echo    https://cursor.com 에서 다운로드하세요.
    start https://cursor.com
    pause
)

:: 3. Chrome 설치 확인
echo.
echo [3/6] 🔍 Chrome 브라우저 확인 중...
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    echo ✅ Chrome이 설치되어 있습니다!
) else if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    echo ✅ Chrome이 설치되어 있습니다!
) else (
    echo ⚠️  Chrome이 설치되지 않았습니다.
    echo    Edge 브라우저를 대신 사용할 수 있습니다.
)

:: 4. Node.js 설치 확인 및 Live Server 준비
echo.
echo [4/6] 🟢 Node.js 설치 확인 중...

:: Node.js 설치 확인
node --version >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Node.js가 설치되어 있습니다!
    node --version
) else (
    echo ⚠️  Node.js가 설치되지 않았습니다.
    echo    https://nodejs.org 에서 다운로드하세요.
    start https://nodejs.org
    echo    Node.js 설치 후 이 스크립트를 다시 실행하세요.
    pause
    exit
)

:: 7. Cursor MCP 설정 (프로젝트별)
echo.
echo [5/6] ⚙️  Cursor MCP 설정 중...

:: 프로젝트 루트의 .cursor 디렉토리에 MCP 설정 파일 생성
cd /d "%PROJECT_DIR%"
if not exist ".cursor" mkdir .cursor

:: 프로젝트별 MCP 설정 파일 생성
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

echo ✅ 프로젝트별 Cursor MCP 설정 완료!

:: 8. Cursor Rules 복사
echo.
echo [6/6] 📋 Cursor Rules 설정 중...

:: .cursor\rules 디렉토리 생성
if not exist ".cursor\rules" mkdir .cursor\rules

:: .cursorrules 파일이 존재하는지 확인하고 복사
if exist ".cursorrules" (
    copy .cursorrules .cursor\rules\base_rule.mdc >nul
    echo ✅ Cursor Rules 복사 완료!
) else (
    echo ⚠️  .cursorrules 파일을 찾을 수 없습니다.
)

echo ✅ 모든 설치 및 설정 완료!

:: 완료
echo.
echo =====================================================
echo    ✅ 설정 완료!
echo =====================================================
echo.
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%
echo ⚙️  MCP 설정: %PROJECT_DIR%\.cursor\mcp.json
echo 📋 Cursor Rules: %PROJECT_DIR%\.cursor\rules\base_rule.mdc
echo.
echo 🚀 다음 단계:
echo    1. Cursor에서 프로젝트 폴더 열기
echo    2. 게임 파일 생성 (HTML/JavaScript)
echo    3. Ctrl+Shift+P → "MCP: Open Browser" 사용!
echo.
echo 🤖 MCP 기능:
echo    - 브라우저 자동 실행
echo    - 게임 자동 테스트
echo    - 스크린샷 촬영
echo.
echo 💡 팁: 이제 Cursor에서 체크리스트 기반 게임 개발을 시작할 수 있습니다!
echo.
pause
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

:: 1. 작업 폴더 생성
echo.
echo [1/10] 📁 작업 폴더 생성 중...
:: 스크립트가 있는 디렉토리로 이동 (프로젝트 루트)
cd /d "%~dp0"
cd ..\..
set PROJECT_DIR=%CD%
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%
if not exist "VibeCoding-workspace" mkdir VibeCoding-workspace
cd VibeCoding-workspace
if not exist "games" mkdir games
if not exist "templates" mkdir templates
if not exist "backup" mkdir backup
echo ✅ 폴더 생성 완료!

:: 2. Cursor 설치 확인
echo.
echo [2/10] 🔍 Cursor 설치 확인 중...
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
echo [3/10] 🔍 Chrome 브라우저 확인 중...
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
echo [4/10] 🟢 Node.js 설치 확인 중...

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

:: 5. Live Server 설치 (전역)
echo.
echo [5/10] 🌐 Live Server 설치 중...
npm list -g live-server >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Live Server가 이미 설치되어 있습니다!
) else (
    echo 📦 Live Server 설치 중... (몇 분 소요될 수 있습니다)
    npm install -g live-server
    if %errorLevel% == 0 (
        echo ✅ Live Server 설치 완료!
    ) else (
        echo ❌ Live Server 설치 실패. 수동 설치가 필요할 수 있습니다.
    )
)

:: 6. 기본 템플릿 생성
echo.
echo [6/10] 📝 게임 템플릿 생성 중...
(
echo ^<!DOCTYPE html^>
echo ^<html^>
echo ^<head^>
echo     ^<title^>🎮 내 첫 번째 게임^</title^>
echo     ^<meta charset="UTF-8"^>
echo     ^<style^>
echo         body { 
echo             margin: 0; 
echo             background: #2c3e50;
echo             display: flex;
echo             justify-content: center;
echo             align-items: center;
echo             height: 100vh;
echo             font-family: Arial, sans-serif;
echo         }
echo         #gameContainer {
echo             text-align: center;
echo         }
echo         #status {
echo             color: white;
echo             font-size: 24px;
echo             margin: 10px;
echo         }
echo         canvas { 
echo             border: 3px solid white;
echo             background: #87CEEB;
echo             cursor: pointer;
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<div id="gameContainer"^>
echo         ^<div id="status"^>🎮 클릭해서 시작!^</div^>
echo         ^<canvas id="game" width="800" height="400"^>^</canvas^>
echo     ^</div^>
echo.
echo     ^<script^>
echo         // 에러가 나도 게임은 계속!
echo         window.onerror = function() {
echo             showStatus("💫 다시 시도 중...");
echo             return true;
echo         };
echo.
echo         function showStatus(message) {
echo             document.getElementById('status').innerText = message;
echo         }
echo.
echo         const canvas = document.getElementById('game');
echo         const ctx = canvas.getContext('2d');
echo.
echo         // 주인공
echo         let hero = {
echo             x: 100,
echo             y: 200,
echo             size: 50,
echo             color: '#3498db'
echo         };
echo.
echo         // 그리기
echo         function draw() {
echo             // 배경
echo             ctx.fillStyle = '#87CEEB';
echo             ctx.fillRect(0, 0, canvas.width, canvas.height);
echo             
echo             // 땅
echo             ctx.fillStyle = '#8FBC8F';
echo             ctx.fillRect(0, 350, canvas.width, 50);
echo             
echo             // 주인공
echo             ctx.fillStyle = hero.color;
echo             ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
echo         }
echo.
echo         // 클릭하면 이동
echo         canvas.addEventListener('click', function(e) {
echo             const rect = canvas.getBoundingClientRect();
echo             hero.x = e.clientX - rect.left - 25;
echo             hero.y = e.clientY - rect.top - 25;
echo             showStatus("👍 좋아요!");
echo             draw();
echo         });
echo.
echo         // 시작!
echo         draw();
echo         showStatus("🎮 게임 준비 완료!");
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) > templates\basic-game.html

echo ✅ 템플릿 생성 완료!

:: 5. VS Code 설정 파일 생성
echo.
echo [5/6] ⚙️  VS Code 설정 파일 생성 중...
if not exist ".vscode" mkdir .vscode
(
echo {
echo   "liveServer.settings.donotShowInfoMsg": true,
echo   "liveServer.settings.donotVerifyTags": true,
echo   "liveServer.settings.port": 5500,
echo   "files.autoSave": "afterDelay",
echo   "files.autoSaveDelay": 1000,
echo   "editor.fontSize": 16,
echo   "editor.wordWrap": "on",
echo   "editor.minimap.enabled": false
echo }
) > .vscode\settings.json

:: 6. MCP 서버 설치 (Playwright)
echo.
echo [7/10] 🤖 MCP 서버 설치 중...

:: Node.js 설치 확인
node --version >nul 2>&1
if %errorLevel% == 0 (
    echo ✅ Node.js가 설치되어 있습니다!
    
    :: MCP Playwright 서버 설치
    echo 📦 MCP Playwright 서버 설치 중...
    npm install -g @playwright/mcp@latest
    
    if %errorLevel% == 0 (
        echo ✅ MCP Playwright 서버 설치 완료!
    ) else (
        echo ⚠️  MCP 서버 설치 실패. 수동 설치가 필요할 수 있습니다.
    )
) else (
    echo ⚠️  Node.js가 설치되지 않았습니다.
    echo    https://nodejs.org 에서 다운로드하세요.
    start https://nodejs.org
)

:: 7. Cursor MCP 설정 (프로젝트별)
echo.
echo [8/10] ⚙️  Cursor MCP 설정 중...

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

:: 작업 디렉토리로 다시 돌아가기
cd VibeCoding-workspace

echo ✅ 프로젝트별 Cursor MCP 설정 완료!

:: 9. 자동 실행 스크립트 생성
echo.
echo [9/10] 🚀 자동 실행 스크립트 생성 중...

:: 게임 자동 실행 스크립트 생성
(
echo @echo off
echo cd /d "%~dp0"
echo echo 🎮 VibeCoding 게임 실행 중...
echo echo.
echo start "" "templates\basic-game.html"
echo timeout /t 2 /nobreak >nul
echo live-server --port=5500 --open=templates/basic-game.html --no-browser
echo pause
) > start-game.bat

echo ✅ 자동 실행 스크립트 생성 완료!

:: 10. 바탕화면 바로가기 생성
echo.
echo [10/10] 🔗 바탕화면에 바로가기 생성 중...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\VibeCoding 워크숍.lnk'); $Shortcut.TargetPath = '%CD%'; $Shortcut.Save()"

:: 완료
echo.
echo =====================================================
echo    ✅ 설정 완료!
echo =====================================================
echo.
echo 📁 프로젝트 디렉토리: %PROJECT_DIR%
echo 📁 작업 폴더: %CD%
echo 📄 템플릿 파일: %CD%\templates\basic-game.html
echo ⚙️  MCP 설정: %PROJECT_DIR%\.cursor\mcp.json
echo.
echo 🚀 시작하는 방법:
echo    1. Cursor에서 프로젝트 폴더 열기 → VibeCoding-workspace 폴더에서 작업
echo    2. File → Open Folder → VibeCoding-workspace 폴더 선택  
echo    3. templates\basic-game.html 열기
echo    4. 우클릭 → "Open with Live Server"
echo    5. 또는 start-game.bat 더블클릭으로 자동 실행!
echo    6. 또는 Cursor에서 Ctrl+Shift+P → "MCP: Open Browser" 사용!
echo.
echo 🌐 Live Server 기능:
echo    - 코드 저장 시 자동 새로고침
echo    - 로컬 서버에서 안전한 실행
echo    - start-game.bat으로 원클릭 실행
echo.
echo 🤖 MCP 기능:
echo    - 브라우저 자동 실행
echo    - 게임 자동 테스트
echo    - 스크린샷 촬영
echo.
echo 💡 팁: Cursor에서 프로젝트를 열어야 MCP 설정이 활성화됩니다!
echo.
pause
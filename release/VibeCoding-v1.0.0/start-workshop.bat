@echo off
chcp 65001 >nul
echo.
echo =====================================================
echo    🎮 VibeCoding 워크샵 시작
echo =====================================================
echo.

:: 브라우저에서 index.html 열기
echo 📖 워크샵 안내 페이지를 엽니다...
start "" "%~dp0index.html"

:: 잠시 대기
timeout /t 2 >nul

:: AI 룰 생성기 열기
echo 🤖 AI 룰 생성기를 엽니다...
start "" "%~dp0ai-rules-generator.html"

echo.
echo ✅ 워크샵 준비 완료!
echo.
echo 다음 단계:
echo 1. AI 룰 생성기에서 아이에게 맞는 설정 선택
echo 2. 생성된 룰을 Cursor의 .cursorrules 파일에 복사
echo 3. sandbox-environments 폴더의 게임 템플릿으로 시작
echo.
pause

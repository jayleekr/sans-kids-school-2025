#!/bin/bash

# VibeCoding Release 빌드 스크립트
echo "🎮 VibeCoding Release 빌드 시작..."

# 버전 설정
VERSION="v1.1.0"
RELEASE_NAME="VibeCoding-${VERSION}"

# Release 디렉토리 생성
rm -rf release
mkdir -p release/${RELEASE_NAME}

# 필수 파일 복사
echo "📦 필수 파일 복사 중..."

# 1. 메인 파일들
cp README.md release/${RELEASE_NAME}/
cp ai-rules-generator.html release/${RELEASE_NAME}/
cp index.html release/${RELEASE_NAME}/
cp .cursorrules release/${RELEASE_NAME}/

# 2. 워크숍 자료
mkdir -p release/${RELEASE_NAME}/workshop-materials
cp -r workshop-materials/* release/${RELEASE_NAME}/workshop-materials/

# 3. 샌드박스 환경
mkdir -p release/${RELEASE_NAME}/sandbox-environments
cp -r sandbox-environments/* release/${RELEASE_NAME}/sandbox-environments/

# 4. 워크플로우
mkdir -p release/${RELEASE_NAME}/workflows
cp -r workflows/* release/${RELEASE_NAME}/workflows/

# 5. 예제
mkdir -p release/${RELEASE_NAME}/examples
cp -r examples/* release/${RELEASE_NAME}/examples/

# 6. 교육 시나리오
mkdir -p release/${RELEASE_NAME}/educational-scenarios
cp -r educational-scenarios/* release/${RELEASE_NAME}/educational-scenarios/

# 7. 이미지 (있으면)
if [ -d "images" ]; then
    mkdir -p release/${RELEASE_NAME}/images
    cp -r images/* release/${RELEASE_NAME}/images/
fi

# 8. 평가 기준
mkdir -p release/${RELEASE_NAME}/evaluation
cp -r evaluation/* release/${RELEASE_NAME}/evaluation/

# 플랫폼 공통 시작 파일 생성
echo "🚀 시작 파일 생성 중..."

# Windows용 start-workshop.bat 생성
cat > release/${RELEASE_NAME}/start-workshop.bat << 'EOF'
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
EOF

# Mac용 start-workshop.sh 생성
cat > release/${RELEASE_NAME}/start-workshop.sh << 'EOF'
#!/bin/bash
echo ""
echo "====================================================="
echo "   🎮 VibeCoding 워크샵 시작"
echo "====================================================="
echo ""

# 브라우저에서 index.html 열기
echo "📖 워크샵 안내 페이지를 엽니다..."
open "$(dirname "$0")/index.html"

# 잠시 대기
sleep 2

# AI 룰 생성기 열기
echo "🤖 AI 룰 생성기를 엽니다..."
open "$(dirname "$0")/ai-rules-generator.html"

echo ""
echo "✅ 워크샵 준비 완료!"
echo ""
echo "다음 단계:"
echo "1. AI 룰 생성기에서 아이에게 맞는 설정 선택"
echo "2. 생성된 룰을 Cursor의 .cursorrules 파일에 복사"
echo "3. sandbox-environments 폴더의 게임 템플릿으로 시작"
echo ""
read -p "아무 키나 누르세요..."
EOF

chmod +x release/${RELEASE_NAME}/start-workshop.sh

# 빠른 시작 가이드 생성
cat > release/${RELEASE_NAME}/QUICK-START.md << 'EOF'
# 🎮 VibeCoding 빠른 시작 가이드

## 🚀 Git 없이 바로 시작하기!

### Windows 사용자
1. `start-workshop.bat` 더블클릭
2. 브라우저에서 자동으로 페이지가 열립니다
3. AI 룰을 생성하고 Cursor에 복사하세요

### Mac 사용자
1. `start-workshop.sh` 더블클릭
2. 브라우저에서 자동으로 페이지가 열립니다
3. AI 룰을 생성하고 Cursor에 복사하세요

## 📁 포함된 내용
- ✅ 모든 게임 템플릿
- ✅ AI 룰 생성기
- ✅ 5가지 교육 워크플로우
- ✅ 워크샵 진행 가이드
- ✅ 예제 게임들

## 🎯 필요한 것
- Cursor (https://cursor.com)
- 웹 브라우저
- 그게 다예요! Git은 필요 없어요!

## 💡 팁
- 게임은 날짜별로 폴더를 만들어 저장하세요
- HTML 파일 하나만 있으면 어디서든 실행 가능합니다
- 친구와 공유할 때는 HTML 파일만 보내면 됩니다

즐거운 게임 만들기! 🌟
EOF

# ZIP 파일 생성
echo "📦 ZIP 파일 생성 중..."
cd release
zip -r ${RELEASE_NAME}.zip ${RELEASE_NAME}/

echo "✅ Release 빌드 완료!"
echo "📁 위치: release/${RELEASE_NAME}.zip"
echo "📦 크기: $(du -h ${RELEASE_NAME}.zip | cut -f1)"
#!/bin/bash

echo ""
echo "====================================================="
echo "   🎮 VibeCoding 워크숍 환경 자동 설정 (macOS)"
echo "====================================================="
echo ""

# 색상 정의
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 1. 프로젝트 디렉토리 설정
echo "[1/8] 📁 프로젝트 디렉토리 설정 중..."
# 스크립트가 있는 디렉토리로 이동 (프로젝트 루트)
cd "$(dirname "$0")"
cd ../..
PROJECT_DIR=$(pwd)
echo "📁 프로젝트 디렉토리: $PROJECT_DIR"
echo -e "${GREEN}✅ 디렉토리 설정 완료!${NC}"

# 2. Cursor 설치 확인
echo ""
echo "[2/8] 🔍 Cursor 설치 확인 중..."
if [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✅ Cursor가 설치되어 있습니다!${NC}"
else
    echo -e "${YELLOW}⚠️  Cursor가 설치되지 않았습니다.${NC}"
    echo "   https://cursor.com 에서 다운로드하세요."
    read -p "   브라우저를 열까요? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        open https://cursor.com
    fi
fi

# 3. Chrome 설치 확인
echo ""
echo "[3/8] 🔍 Chrome 브라우저 확인 중..."
if [ -d "/Applications/Google Chrome.app" ]; then
    echo -e "${GREEN}✅ Chrome이 설치되어 있습니다!${NC}"
else
    echo -e "${YELLOW}⚠️  Chrome이 설치되지 않았습니다.${NC}"
    echo "   Safari를 대신 사용할 수 있습니다."
fi

# 4. Live Server 설치
echo ""
echo "[4/8] 🌐 Live Server 설치 중..."

# Node.js 및 npm 확인
if command -v npm &> /dev/null; then
    echo "📦 Live Server 설치 확인 중..."
    if npm list -g live-server &> /dev/null; then
        echo -e "${GREEN}✅ Live Server가 이미 설치되어 있습니다!${NC}"
    else
        echo "📦 Live Server 설치 중... (몇 분 소요될 수 있습니다)"
        npm install -g live-server
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Live Server 설치 완료!${NC}"
        else
            echo -e "${RED}❌ Live Server 설치 실패. 수동 설치가 필요할 수 있습니다.${NC}"
        fi
    fi
else
    echo -e "${YELLOW}⚠️  npm이 설치되지 않았습니다. Node.js를 먼저 설치하세요.${NC}"
fi

echo -e "${GREEN}✅ Live Server 설치 체크 완료!${NC}"

# 5. MCP 서버 설치 (Playwright)
echo ""
echo "[5/8] 🤖 MCP 서버 설치 중..."

# Node.js 설치 확인
if command -v node &> /dev/null; then
    echo -e "${GREEN}✅ Node.js가 설치되어 있습니다! (버전: $(node --version))${NC}"
    
    # MCP Playwright 서버 설치
    echo "📦 MCP Playwright 서버 설치 중..."
    npm install -g @playwright/mcp@latest
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ MCP Playwright 서버 설치 완료!${NC}"
    else
        echo -e "${YELLOW}⚠️  MCP 서버 설치 실패. 수동 설치가 필요할 수 있습니다.${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Node.js가 설치되지 않았습니다.${NC}"
    echo "   Homebrew로 설치하시겠습니까?"
    read -p "   설치하려면 y를 누르세요 (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v brew &> /dev/null; then
            brew install node
        else
            echo "   Homebrew가 설치되지 않았습니다. https://nodejs.org 에서 수동 설치하세요."
        fi
    fi
fi

# 6. Cursor MCP 설정 (프로젝트별)
echo ""
echo "[6/8] ⚙️  Cursor MCP 설정 중..."

# 프로젝트 루트의 .cursor 디렉토리에 MCP 설정 파일 생성
cd "$PROJECT_DIR"
mkdir -p .cursor

# 프로젝트별 MCP 설정 파일 생성
cat > .cursor/mcp.json << 'EOF'
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": [
        "@playwright/mcp@latest"
      ]
    }
  }
}
EOF

echo -e "${GREEN}✅ 프로젝트별 Cursor MCP 설정 완료!${NC}"

# 8. Cursor Rules 복사
echo ""
echo "[7/8] 📋 Cursor Rules 설정 중..."

# .cursor/rules 디렉토리 생성
mkdir -p .cursor/rules

# .cursorrules 파일이 존재하는지 확인하고 복사
if [ -f ".cursorrules" ]; then
    cp .cursorrules .cursor/rules/base_rule.mdc
    echo -e "${GREEN}✅ Cursor Rules 복사 완료!${NC}"
else
    echo -e "${YELLOW}⚠️  .cursorrules 파일을 찾을 수 없습니다.${NC}"
fi

echo -e "${GREEN}✅ MCP 설정 완료!${NC}"

# 8. 최종 완료
echo ""
echo "[8/8] 🎉 최종 설정 완료 중..."
echo -e "${GREEN}✅ 모든 설치 및 설정 완료!${NC}"

# 완료
echo ""
echo "====================================================="
echo -e "   ${GREEN}✅ 설정 완료!${NC}"
echo "====================================================="
echo ""
echo "📁 프로젝트 디렉토리: $PROJECT_DIR"
echo "⚙️  MCP 설정: $PROJECT_DIR/.cursor/mcp.json"
echo "📋 Cursor Rules: $PROJECT_DIR/.cursor/rules/base_rule.mdc"
echo ""
echo "🚀 다음 단계:"
echo "   1. Cursor에서 프로젝트 폴더 열기"
echo "   2. 게임 파일 생성 (HTML/JavaScript)"
echo "   3. Cmd+Shift+P → 'MCP: Open Browser' 사용!"
echo ""
echo "🤖 MCP 기능:"
echo "   - 브라우저 자동 실행"
echo "   - 게임 자동 테스트"
echo "   - 스크린샷 촬영"
echo ""
echo "💡 팁: 이제 Cursor에서 체크리스트 기반 게임 개발을 시작할 수 있습니다!"
echo ""
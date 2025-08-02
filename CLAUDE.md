# CLAUDE.md

이 파일은 Claude Code (claude.ai/code)가 이 저장소의 코드를 작업할 때 필요한 가이드를 제공합니다.

## 프로젝트 개요

VibeCoding은 8-16세 아이들에게 Cursor와 AI 협업을 통한 게임 개발을 가르치는 교육 워크숍 시스템입니다. 이 프로젝트는 전통적인 프로그래밍 지식보다 "문제 설정, 분해, AI 관리 능력"을 강조합니다.

## 핵심 철학

- **아이들을 위한 디버깅 금지**: 아이들은 절대 디버깅할 필요가 없어야 합니다. 게임은 에러가 있어도 계속 실행되어야 합니다.
- **즉각적인 피드백**: 코드 변경사항은 10초 내에 보여야 합니다 (저장 → 자동 새로고침 → 결과 확인).
- **단일 HTML 파일 전략**: 빌드 복잡성을 제거하기 위해 모든 코드(HTML, CSS, JavaScript)를 하나의 파일에 포함.
- **에러 방지 아키텍처**: try-catch 블록, 기본값, 실패 방지 메커니즘 사용.
- **한국어 문서화 표준**: 모든 문서, 주석, 사용자 대면 텍스트, 워크숍 자료는 한국 아이들과 진행자의 접근성을 위해 한국어로 작성되어야 합니다.

## 아키텍처 개요

### 저장소 구조
```
├── workflows/                    # 5가지 교육 접근법 (Cursor Rules 변형)
│   ├── workflow-1-friendly-teacher/    # 격려 중심
│   ├── workflow-2-problem-solver/      # 소크라테스 방식
│   ├── workflow-3-quick-implementation/ # 빠른 결과
│   ├── workflow-4-storytelling/        # 서사 중심
│   └── workflow-5-checklist/           # 체계적 접근
├── sandbox-environments/         # 개발 템플릿 및 도구
├── workshop-materials/          # 진행자 가이드 및 자동화
└── evaluation/                  # 평가 기준
```

### 워크플로우 시스템
이 프로젝트는 Cursor Rules 파일을 통해 5가지 다른 AI 교육 성격을 구현합니다. 각 워크플로우는 다른 학습 스타일을 대상으로 합니다:
- 8-10세: 친절한 선생님 또는 스토리텔링
- 11-13세: 문제 해결 코치 또는 체크리스트  
- 14-16세: 빠른 구현 또는 문제 해결 코치

## 개발 명령어

### 환경 설정
```bash
# Windows (관리자 권한으로 실행) - MCP Playwright 포함
workshop-materials/setup-automation/setup-windows.bat

# Mac/Linux - MCP Playwright 포함
chmod +x workshop-materials/setup-automation/setup-mac.sh
./workshop-materials/setup-automation/setup-mac.sh
```

### MCP 통합
설정 스크립트는 이제 MCP Playwright를 자동으로 설치하고 구성합니다:
- **자동 브라우저 실행**: `Ctrl+Shift+P` → "MCP: Open Browser"
- **게임 테스트 자동화**: AI가 자동으로 게임 기능을 테스트할 수 있습니다
- **스크린샷 캡처**: 자동 게임 진행 상황 문서화
- **향상된 워크플로우**: 코드 → 저장 → MCP 자동 테스트 → 시각적 피드백

### 게임 개발 워크플로우
1. **기본 템플릿으로 시작**: `sandbox-environments/game-template-starter.html` 사용
2. **실행 옵션**:
   - **방법 1**: HTML 파일 우클릭 → "Open with Live Server"
   - **방법 2**: `Ctrl+Shift+P` → "MCP: Open Browser" (자동화)
3. **향상된 개발 사이클**: 코드 편집 → 저장 (Ctrl+S) → MCP 자동 테스트 → 시각적 피드백
4. **화면 레이아웃**: Cursor (50%) + 브라우저 (50%) 나란히 배치

### 워크플로우 테스트
다른 교육 접근법을 테스트하려면:
1. `workflows/[workflow-name]/cursor-rules.md`에서 내용 복사
2. Cursor의 `.cursorrules` 파일에 붙여넣기
3. "바나나 히어로의 모험" 게임 개발 시나리오로 테스트
4. `workshop-materials/expected-questions.md`의 질문 사용

## 주요 기술적 제약사항

### 필수 기술
- **단일 HTML 파일만 사용** - 별도의 CSS/JS 파일 없음
- **Canvas API** 그래픽 사용 (복잡한 프레임워크 피하기)
- **인라인 스타일** 및 스크립트
- **CDN 라이브러리만 사용** (중급 레벨에서는 p5.js 허용)

### 금지된 기술
- Node.js, npm, yarn 또는 모든 빌드 도구
- 별도의 에셋 파일
- 서버 측 기능
- 복잡한 프레임워크 (React, Vue 등)
- 데이터베이스 연결

### 에러 방지 패턴
```javascript
// 항상 게임 로직을 try-catch로 감싸기
function safeGameLoop() {
    try {
        updateGame();
        drawGame();
    } catch (e) {
        showMessage("🔄 다시 시도 중...");
    }
    requestAnimationFrame(safeGameLoop);
}

// 모든 곳에서 기본값 사용
const hero = hero || { x: 100, y: 300, size: 50 };

// console.log를 시각적 피드백으로 대체
function showMessage(text) {
    document.getElementById('status').innerText = text;
}
```

## Game Template Architecture

### Base Game Structure
Every game follows this pattern:
1. **Canvas setup** (800x400px recommended)
2. **Game state objects** (hero, enemies, projectiles, score)
3. **Input handling** (keyboard events with focus management)
4. **Game loop** (update → draw → repeat)
5. **Error-proof rendering** (never let drawing functions crash)

### Standard Game Objects
```javascript
const hero = {
    x: 100, y: 300, size: 50, color: '#3498db',
    velocityY: 0, isJumping: false
};

const gameState = {
    score: 0, gameOver: false, paused: false
};
```

## Workshop Facilitation

### Setup Automation
Run platform-specific setup scripts to create:
- VibeCoding folder structure
- Basic game template
- VS Code/Cursor configuration
- Desktop shortcuts

### Emergency Protocols
1. **30-second rule**: If issue not resolved in 30s, use backup method
2. **Offline backup**: Use `workshop-materials/offline-backup/` templates
3. **No-debugging approach**: Replace error investigation with template reset
4. **Positive framing**: "Error는 배우는 기회야!" (Errors are learning opportunities!)

### Success Metrics
- **Completion rate**: 80%+ finish basic game
- **Feature implementation**: 70%+ add movement, 50%+ add additional features  
- **Engagement**: All children participate in final presentation
- **Satisfaction**: "다시 하고 싶어요!" (Want to do again!)

## Common Issues & Solutions

### "화면이 안 나와요" (Screen not showing)
1. Check file saved (Ctrl+S)
2. Refresh browser (F5)
3. Restart Live Server
4. **Backup**: Open HTML file directly in browser

### "키보드가 안 먹어요" (Keyboard not working)  
1. Click on game canvas to focus
2. Check case sensitivity in key names
3. **Backup**: Switch to mouse-click controls

### "에러가 났어요" (Error occurred)
1. **Never debug with children**
2. Use positive language: "좋은 발견이야!"
3. Reset to last working state (Ctrl+Z)
4. **Backup**: Load fresh template

## File Naming Conventions
- Game files: `game-[feature].html` (e.g., `game-basic.html`)
- Templates: `sandbox-[complexity].html`
- Cursor rules: `cursor-rules.md` (one per workflow)
- Setup scripts: `setup-[platform].[ext]`

## Workshop Game: "바나나 히어로의 모험"
Standard test game featuring:
- Flying monkey hero (keyboard movement)
- Banana throwing mechanics (Z key)
- Enemy characters that slip on bananas
- Score system
- Simple physics (jumping, gravity)

This serves as the consistent baseline for testing all workflow approaches.

## Key Files to Understand

- `sandbox-environments/no-debug-approach.md` - Core philosophy and implementation
- `workshop-materials/facilitator-checklist.md` - Complete workshop timeline  
- `workshop-materials/emergency-troubleshooting.md` - 30-second problem resolution
- `workshop-materials/mcp-automation-guide.md` - MCP Playwright automation and browser testing
- `workflows/` - 5 different teaching approaches to test
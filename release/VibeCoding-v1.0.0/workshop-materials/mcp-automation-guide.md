# MCP 자동화 가이드 - VibeCoding 워크숍

## 🤖 MCP (Model Context Protocol) 통합

MCP Playwright 서버를 통해 브라우저 자동화와 게임 테스트를 자동화할 수 있습니다.

## 자동 설치 완료 기능

✅ **Windows**: `setup-windows.bat` 실행 시 자동 설치
✅ **macOS**: `setup-mac.sh` 실행 시 자동 설치

## 🚀 MCP가 제공하는 기능

### 1. 브라우저 자동 실행
```
Cursor에서: Ctrl+Shift+P (Win) / Cmd+Shift+P (Mac)
→ "MCP: Open Browser" 입력
→ 게임이 자동으로 브라우저에서 실행됩니다!
```

### 2. 게임 자동 테스트
```javascript
// AI에게 이렇게 요청하세요:
"MCP를 사용해서 내 게임을 테스트해줘. 
- 캐릭터가 잘 움직이는지 확인
- 클릭했을 때 반응하는지 확인  
- 스크린샷도 찍어줘"
```

### 3. 스크린샷 자동 촬영
```javascript
// 게임 진행 상황을 자동으로 캡처
// 부모님께 보여주거나 포트폴리오 제작에 활용
```

## 설치 확인 방법

### Windows
1. 명령 프롬프트에서 `npm list -g @modelcontextprotocol/server-playwright`
2. 설치되어 있으면 버전 정보가 표시됩니다.

### macOS  
1. 터미널에서 `npm list -g @modelcontextprotocol/server-playwright`
2. 설치되어 있으면 버전 정보가 표시됩니다.

## Cursor 설정 파일 위치

### Windows
```
%APPDATA%\Cursor\User\settings.json
```

### macOS
```
~/Library/Application Support/Cursor/User/settings.json
```

## MCP 설정 내용
```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-playwright"],
      "env": {}
    }
  }
}
```

## 🎯 워크숍에서 활용 방법

### 아이들에게 보여주기
1. **"AI야, 내 게임을 브라우저에서 열어줘!"**
   - Cursor에서 MCP 명령어로 자동 실행
   - 마법처럼 브라우저가 열리며 게임 실행

2. **"AI야, 내 게임이 잘 작동하는지 테스트해줘!"**
   - 자동으로 클릭 테스트
   - 키보드 입력 테스트
   - 결과를 스크린샷으로 보여줌

3. **"AI야, 완성된 게임 사진을 찍어줘!"**
   - 자동 스크린샷 촬영
   - 포트폴리오나 자랑용으로 활용

### 부모님 가이드
```
자녀: "AI야, 게임을 브라우저에서 열어줘!"
부모: "우와, 정말 신기하다! AI가 브라우저도 열어주네?"
자녀: "맞아요! 이제 테스트도 해달라고 해볼게요!"
```

## 문제 해결

### MCP 서버가 시작되지 않을 때
1. **Node.js 설치 확인**: `node --version`
2. **npm 전역 설치 확인**: `npm list -g`
3. **Cursor 재시작** 후 다시 시도

### 권한 문제 (macOS)
```bash
# 관리자 권한으로 설치
sudo npm install -g @modelcontextprotocol/server-playwright
```

### 방화벽 문제 (Windows)
- Windows Defender에서 Node.js 허용
- 필요시 관리자 권한으로 실행

## 🎮 실전 사용 예시

### 게임 개발 → 자동 테스트 → 스크린샷 워크플로우

1. **게임 코드 작성**
```javascript
// 아이가 Cursor에서 게임 코드 작성
```

2. **MCP로 자동 실행**
```
Cmd+Shift+P → "MCP: Open Browser"
```

3. **AI에게 테스트 요청**
```
"AI야, MCP를 사용해서:
1. 내 게임을 브라우저에서 열어줘
2. 캐릭터를 여러 곳에 클릭해서 이동시켜봐
3. 키보드 화살표키로 움직여봐  
4. 게임 화면 스크린샷을 찍어줘"
```

4. **결과 확인 및 개선**
```
AI가 자동으로:
- 브라우저 실행 ✅
- 클릭 테스트 ✅  
- 키보드 테스트 ✅
- 스크린샷 촬영 ✅
- 문제점 발견 시 보고 ✅
```

## 🏆 기대 효과

1. **즉시 피드백**: 코드 → 저장 → 자동 실행 → 즉시 확인
2. **자동 테스트**: 수동 테스트 없이 AI가 게임 기능 검증
3. **포트폴리오**: 자동 스크린샷으로 작품 기록
4. **재미 요소**: "AI가 내 게임을 테스트해줘!" 마법 같은 경험

이제 아이들은 게임을 만들고 → AI에게 테스트를 맡기고 → 결과를 확인하는 완전 자동화된 개발 환경에서 VibeCoding을 경험할 수 있습니다! 🎮✨
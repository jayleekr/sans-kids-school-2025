# VibeCoding 빠른 피드백 루프 가이드

## 🎯 목표
코드 작성 → 실행 → 결과 확인까지 10초 이내 완료

## ⚡ Cursor 최적화 설정

### 1. VS Code 설정 (.vscode/settings.json)
```json
{
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 500,
  "liveServer.settings.donotShowInfoMsg": true,
  "liveServer.settings.donotVerifyTags": true,
  "liveServer.settings.port": 5500,
  "liveServer.settings.CustomBrowser": "chrome",
  "liveServer.settings.AdvanceCustomBrowserCmdLine": "chrome --incognito --remote-debugging-port=9222",
  "editor.formatOnSave": false,
  "editor.wordWrap": "on",
  "editor.fontSize": 16,
  "editor.minimap.enabled": false
}
```

### 2. 키보드 단축키 설정
```json
{
  "key": "cmd+r",
  "command": "liveServer.goOnline",
  "when": "editorTextFocus && editorLangId == html"
}
```

## 🖥️ 화면 배치 최적화

### 이상적인 레이아웃
```
┌─────────────────┬─────────────────┐
│                 │                 │
│     Cursor      │    브라우저      │
│   (코드 편집)    │   (게임 실행)    │
│                 │                 │
│                 ├─────────────────┤
│                 │   콘솔 (F12)    │
│                 │   (디버깅용)     │
└─────────────────┴─────────────────┘
```

### macOS 화면 분할
- 왼쪽: Cursor (50%)
- 오른쪽 위: Chrome (35%)
- 오른쪽 아래: Chrome DevTools (15%)

## 🔄 즉시 실행 워크플로우

### 1. 파일 생성 즉시 실행 가능한 템플릿
```html
<!DOCTYPE html>
<html>
<head>
    <title>게임</title>
    <style>
        body { margin: 0; padding: 20px; }
        canvas { border: 2px solid black; }
    </style>
</head>
<body>
    <h1>🎮 내 게임</h1>
    <canvas id="game" width="600" height="400"></canvas>
    <script>
        console.log("✅ 게임 파일이 실행되었습니다!");
        // 여기부터 코드 작성
    </script>
</body>
</html>
```

### 2. 자동 새로고침 설정
- Live Server 사용 시 저장하면 자동 새로고침
- 수동일 경우: Cmd+S (저장) → Cmd+Tab (브라우저) → Cmd+R (새로고침)

## 📊 실시간 디버깅 도구

### 1. 콘솔 로그 템플릿
```javascript
// 상태 확인용 로그
console.log("🎮 게임 상태:", {
    주인공위치: { x: hero.x, y: hero.y },
    점수: score,
    적개수: enemies.length
});

// 이벤트 로그
console.log("⌨️ 키 입력:", e.key);
console.log("🍌 바나나 발사!");
console.log("💥 충돌 발생!");
```

### 2. 시각적 디버깅
```javascript
// 디버그 모드 토글 (D키)
let debugMode = false;
document.addEventListener('keypress', (e) => {
    if (e.key === 'd') debugMode = !debugMode;
});

// 게임 루프에서
if (debugMode) {
    // 충돌 박스 표시
    ctx.strokeStyle = 'red';
    ctx.strokeRect(hero.x, hero.y, hero.width, hero.height);
    
    // 좌표 표시
    ctx.fillStyle = 'white';
    ctx.fillText(`(${Math.round(hero.x)}, ${Math.round(hero.y)})`, hero.x, hero.y - 5);
}
```

### 3. 실시간 상태 표시
```html
<!-- HTML에 추가 -->
<div id="debug-panel" style="position: fixed; top: 10px; right: 10px; background: rgba(0,0,0,0.8); color: white; padding: 10px; font-family: monospace;">
    <div>FPS: <span id="fps">0</span></div>
    <div>Objects: <span id="objects">0</span></div>
    <div>Keys: <span id="keys">-</span></div>
</div>
```

## 🎯 10초 피드백 체크리스트

### 코드 작성 (3초)
- [ ] 작은 기능 하나만 추가
- [ ] 10줄 이하의 코드
- [ ] 명확한 변수명 사용

### 저장 및 실행 (2초)
- [ ] Ctrl/Cmd + S로 저장
- [ ] Live Server 자동 새로고침 확인
- [ ] 브라우저 탭 활성화

### 결과 확인 (3초)
- [ ] 화면에 변화 확인
- [ ] 콘솔 에러 체크
- [ ] 예상대로 작동하는지 확인

### 다음 단계 결정 (2초)
- [ ] 성공 → 다음 기능 추가
- [ ] 실패 → 콘솔 확인 후 수정
- [ ] 부분 성공 → 미세 조정

## 🛠️ 문제 해결 빠른 참조

### "아무것도 안 보여요"
```javascript
// 1. 캔버스 확인
console.log("캔버스:", canvas);
console.log("크기:", canvas.width, "x", canvas.height);

// 2. 그리기 확인
ctx.fillStyle = 'red';
ctx.fillRect(0, 0, 100, 100);
```

### "키보드가 안 먹어요"
```javascript
// 키 입력 테스트
document.addEventListener('keydown', (e) => {
    console.log("눌린 키:", e.key, e.keyCode);
});
```

### "너무 빨라요/느려요"
```javascript
// 속도 조절 변수
const GAME_SPEED = 1; // 0.5 = 느리게, 2 = 빠르게

// 사용
hero.x += 5 * GAME_SPEED;
```

## 📱 모바일 친화적 개발

### 터치 이벤트 추가
```javascript
// 모바일 터치 지원
canvas.addEventListener('touchstart', (e) => {
    const touch = e.touches[0];
    const rect = canvas.getBoundingClientRect();
    const x = touch.clientX - rect.left;
    
    if (x < canvas.width / 2) {
        keys['ArrowLeft'] = true;
    } else {
        keys['ArrowRight'] = true;
    }
});

canvas.addEventListener('touchend', () => {
    keys['ArrowLeft'] = false;
    keys['ArrowRight'] = false;
});
```

## 🎉 성공 지표

### 기술적 성공
- 저장 → 실행 → 결과 확인: 10초 이내
- 에러 → 수정 → 재실행: 30초 이내
- 새 기능 추가: 5분 이내

### 교육적 성공
- 아이가 직접 수정 시도
- "한 번 더 해보고 싶어요!"
- 자신만의 아이디어 제안

## 🚀 다음 단계

1. **기본 템플릿 마스터**: 5분 안에 기본 게임 틀 완성
2. **기능 라이브러리 구축**: 복사-붙여넣기용 코드 조각 모음
3. **커스텀 단축키**: 자주 쓰는 코드 스니펫 등록
4. **팀 플레이**: 아이와 부모가 번갈아가며 코딩
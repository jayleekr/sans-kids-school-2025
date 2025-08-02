# VibeCoding 최적 설정 가이드

## 🎯 추천하는 설정: Cursor + Chrome

### 이유
1. **Cursor**: AI 코드 도우미 (작성이 쉬움)
2. **Chrome**: 게임 실행 환경 (크고 안정적)
3. **Live Server**: 자동 새로고침 (즉각적 피드백)

## 🚀 5분 설정 가이드

### Step 1: Cursor 설정 (1분)
```bash
# 1. Cursor 열기
# 2. Extensions 탭 → "Live Server" 검색 → 설치
# 3. 완료!
```

### Step 2: 프로젝트 생성 (1분)
```bash
# 1. 폴더 생성: "내게임"
# 2. Cursor로 폴더 열기
# 3. 새 파일: game.html
```

### Step 3: 기본 템플릿 (1분)
```html
<!DOCTYPE html>
<html>
<head>
    <title>🎮 내 게임</title>
    <style>
        body { 
            margin: 0; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            background: #2c3e50;
        }
        canvas { 
            border: 3px solid white;
            background: #87CEEB;
        }
    </style>
</head>
<body>
    <canvas id="game" width="800" height="400"></canvas>
    <script>
        const canvas = document.getElementById('game');
        const ctx = canvas.getContext('2d');
        
        // 주인공
        const hero = {
            x: 100,
            y: 200,
            size: 50,
            color: 'blue'
        };
        
        // 그리기
        function draw() {
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
        }
        
        draw();
        console.log("🎮 게임 시작!");
    </script>
</body>
</html>
```

### Step 4: 실행 (1분)
1. 파일 저장: `Cmd+S`
2. 우클릭 → "Open with Live Server"
3. Chrome 열림 → 게임 실행!

### Step 5: 화면 배치 (1분)
- macOS: 좌우 분할 (Window → Tile Window to Left/Right)
- Windows: Win + 좌/우 화살표

## 🎨 아이들을 위한 팁

### 1. 큰 글씨로
```json
// Cursor 설정
{
    "editor.fontSize": 18,
    "editor.lineHeight": 24
}
```

### 2. 재미있는 콘솔 메시지
```javascript
console.log("🎮 게임 시작!");
console.log("🦸 주인공 등장!");
console.log("💥 와! 폭발이다!");
console.log("🏆 최고 점수!");
```

### 3. 즉각적인 시각 피드백
```javascript
// 클릭하면 색 바뀌기
canvas.addEventListener('click', () => {
    hero.color = `hsl(${Math.random() * 360}, 100%, 50%)`;
    draw();
    console.log("🎨 색이 바뀌었어요!");
});
```

## 🚨 자주 묻는 질문

### Q: "화면이 안 나와요"
A: 
1. 파일 저장했나요? (Cmd+S)
2. Live Server 실행했나요?
3. 브라우저가 열렸나요?

### Q: "키보드가 안 먹어요"
A: 게임 화면(Canvas)을 한 번 클릭하세요!

### Q: "너무 작아요/커요"
A: Canvas 크기 조절:
```javascript
// 작게
<canvas width="600" height="300">

// 크게
<canvas width="1000" height="600">
```

## 🏁 체크리스트

### 워크숍 시작 전
- [ ] Cursor 설치
- [ ] Live Server 확장 설치
- [ ] Chrome 설치
- [ ] 템플릿 파일 준비

### 아이와 시작할 때
- [ ] 화면 반반 나누기
- [ ] 글씨 크기 키우기
- [ ] 첫 실행 성공하기
- [ ] "와! 됐다!" 환호성

## 💡 프로 팁

### 1. 자동 저장 설정
```json
{
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 1000
}
```

### 2. 이모지 단축키
- Windows: `Win + .`
- macOS: `Cmd + Control + Space`

### 3. 빠른 복사
- 전체 선택: `Cmd+A`
- 복사: `Cmd+C`
- 붙여넣기: `Cmd+V`

이제 준비 완료! 아이들과 즐거운 게임 만들기를 시작하세요! 🎮✨
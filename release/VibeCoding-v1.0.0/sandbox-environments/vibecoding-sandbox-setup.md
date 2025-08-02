# VibeCoding 샌드박스 환경 설정 가이드

## 🎯 목표
아이들이 Cursor 안에서 코드 작성 즉시 게임을 플레이할 수 있는 환경 구축

## 🏗️ 샌드박스 환경 구성

### 1. 단일 HTML 파일 전략 (권장)
- **장점**: 설치 불필요, 즉시 실행, 파일 관리 간단
- **실행 방법**: 
  - Cursor에서 HTML 파일 열기
  - 우클릭 → "Open with Live Server" 또는
  - 브라우저로 직접 파일 열기

### 2. 프레임워크 선택 기준
```yaml
p5.js:
  장점: 
    - 그래픽/애니메이션 쉬움
    - 에러 메시지 친절
    - 문서화 잘됨
  단점:
    - 추가 학습 필요
    
순수 HTML/JS:
  장점:
    - 가장 단순
    - 추가 의존성 없음
    - 직관적
  단점:
    - 고급 기능 구현 어려움

Phaser (비추천):
  이유:
    - 설정 복잡
    - 학습 곡선 높음
    - 빌드 필요
```

## 📁 프로젝트 구조 (최소화)

```
바나나히어로/
├── index.html (게임 파일 - 이것만 있어도 됨!)
└── README.md (선택사항 - 부모님용 가이드)
```

## 🚀 즉시 실행 가능한 기본 템플릿

### 초급자용 (모든 것이 하나의 파일에)
```html
<!DOCTYPE html>
<html>
<head>
    <title>내가 만든 게임</title>
    <style>
        /* 여기에 스타일 */
        body { background: skyblue; }
        canvas { border: 2px solid black; }
    </style>
</head>
<body>
    <canvas id="game" width="800" height="400"></canvas>
    <script>
        // 여기에 게임 코드
        const canvas = document.getElementById('game');
        const ctx = canvas.getContext('2d');
        
        // 게임 시작!
    </script>
</body>
</html>
```

## 🔧 Cursor 설정 최적화

### 1. Live Server 확장 설치
```json
// .vscode/extensions.json
{
    "recommendations": [
        "ritwickdey.LiveServer"
    ]
}
```

### 2. 자동 저장 설정
```json
// .vscode/settings.json
{
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 1000,
    "liveServer.settings.donotShowInfoMsg": true,
    "liveServer.settings.donotVerifyTags": true
}
```

### 3. 단축키 설정
- `Cmd/Ctrl + S`: 저장 (자동으로 브라우저 새로고침)
- `Cmd/Ctrl + Shift + P` → "Live Server: Open"

## 🎮 빠른 피드백 루프 구현

### 1. 콘솔 로그 활용
```javascript
// 아이들이 즉시 피드백을 볼 수 있도록
console.log("🎮 게임 시작!");
console.log("🐵 주인공 위치:", hero.x, hero.y);
console.log("🍌 바나나 발사!");
```

### 2. 시각적 디버깅
```javascript
// 충돌 박스 보이기 (디버그 모드)
if (debugMode) {
    ctx.strokeStyle = 'red';
    ctx.strokeRect(hero.x, hero.y, hero.width, hero.height);
}
```

### 3. 에러 친화적 처리
```javascript
// 에러가 나도 게임이 멈추지 않도록
try {
    updateGame();
} catch (error) {
    console.error("🚨 문제 발생:", error.message);
    // 게임은 계속 실행
}
```

## 🛡️ 샌드박스 제한사항

### 허용
- Canvas API
- 기본 JavaScript
- 키보드/마우스 이벤트
- 로컬 스토리지 (점수 저장)
- 오디오 (효과음)

### 제한/금지
- 외부 API 호출
- 파일 시스템 접근
- 복잡한 빌드 도구
- Node.js 의존성
- 서버 필요 기능

## 📚 프레임워크별 시작 명령어

### p5.js 버전
```html
<!-- CDN으로 바로 시작 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.7.0/p5.min.js"></script>
```

### 순수 JavaScript 버전
```html
<!-- 아무것도 필요 없음! 바로 시작 -->
<script>
    // 게임 코드
</script>
```

## 🎯 워크숍 진행자를 위한 체크리스트

### 사전 준비
- [ ] Cursor 설치 확인
- [ ] Live Server 확장 설치
- [ ] 브라우저 개발자 도구 열기 방법 안내
- [ ] 템플릿 파일 준비

### 환경 테스트
- [ ] HTML 파일 생성 → 저장 → 브라우저 확인
- [ ] 코드 수정 → 저장 → 자동 새로고침 확인
- [ ] 콘솔 로그 확인
- [ ] 에러 발생 시 대처 방법

### 최적 워크플로우
1. Cursor에서 `game.html` 생성
2. 템플릿 코드 붙여넣기
3. 우클릭 → "Open with Live Server"
4. 브라우저와 Cursor 나란히 배치
5. 코드 수정 → 자동 반영 확인

## 🚨 자주 발생하는 문제와 해결

### "화면이 안 나와요"
- Live Server 실행 확인
- 브라우저 새로고침 (F5)
- 콘솔 에러 확인

### "키보드가 안 먹어요"
- 게임 캔버스 클릭해서 포커스 주기
- 대소문자 확인
- 이벤트 리스너 등록 확인

### "수정해도 안 바뀌어요"
- 파일 저장했는지 확인
- 브라우저 캐시 비우기 (Ctrl+F5)
- Live Server 재시작
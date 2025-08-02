# 🔒 VibeCoding 오프라인 백업 템플릿

## 🚨 상황별 백업 전략

### 인터넷 연결 문제
- Live Server 대신 파일 직접 실행
- CDN 라이브러리 로컬 복사본 사용
- 오프라인 도움말 제공

### Cursor 오류
- 메모장/TextEdit 대체 사용법
- VS Code 백업 사용법
- HTML 파일 직접 수정

## 📁 백업 템플릿 구조

```
offline-backup/
├── basic-game-standalone.html      # 완전 독립 실행 게임
├── emergency-template.html         # 긴급 상황용 최소 템플릿
├── code-blocks/                    # 복사-붙여넣기용 코드 조각
│   ├── movement.js
│   ├── jump.js
│   ├── shooting.js
│   └── enemies.js
├── assets/                         # 오프라인 에셋
│   ├── sounds/
│   └── images/
└── instructions/                   # 오프라인 가이드
    ├── no-internet.md
    ├── no-cursor.md
    └── emergency-guide.md
```

## 🎮 완전 독립 실행 게임 템플릿

### basic-game-standalone.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>🎮 오프라인 게임</title>
    <meta charset="UTF-8">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Courier New', monospace;
        }
        #gameWrapper {
            background: rgba(255,255,255,0.95);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
        }
        #status {
            font-size: 20px;
            margin: 10px 0;
            color: #333;
            font-weight: bold;
        }
        canvas { 
            border: 3px solid #333;
            background: linear-gradient(to bottom, #87CEEB 0%, #98FB98 100%);
            cursor: crosshair;
            border-radius: 10px;
        }
        #controls {
            margin-top: 15px;
        }
        button {
            padding: 10px 20px;
            margin: 5px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            background: #4CAF50;
            color: white;
            font-weight: bold;
        }
        button:hover {
            background: #45a049;
            transform: translateY(-2px);
        }
        #score {
            font-size: 24px;
            color: #FF6B6B;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="gameWrapper">
        <h1>🎮 나만의 게임</h1>
        <div id="status">클릭해서 시작하세요!</div>
        <div id="score">점수: 0</div>
        <canvas id="game" width="600" height="400"></canvas>
        
        <div id="controls">
            <button onclick="changeHeroColor()">🎨 색상 변경</button>
            <button onclick="addEnemy()">👹 적 추가</button>
            <button onclick="speedUp()">⚡ 스피드업</button>
            <button onclick="reset()">🔄 다시시작</button>
        </div>
    </div>

    <script>
        // 🛡️ 에러 방지
        window.onerror = () => true;
        
        // 게임 상태
        let gameState = {
            score: 0,
            speed: 1,
            running: true
        };
        
        // 게임 객체들
        let hero = {
            x: 50,
            y: 200,
            size: 30,
            color: '#FF6B6B',
            targetX: 50,
            targetY: 200
        };
        
        let enemies = [];
        let particles = [];
        
        // 캔버스 설정
        const canvas = document.getElementById('game');
        const ctx = canvas.getContext('2d');
        
        // 상태 표시
        function showStatus(message) {
            document.getElementById('status').innerText = message;
            document.getElementById('score').innerText = `점수: ${gameState.score}`;
        }
        
        // 주인공 색상 변경
        function changeHeroColor() {
            const colors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEAA7', '#DDA0DD'];
            hero.color = colors[Math.floor(Math.random() * colors.length)];
            showStatus("🎨 새로운 색상!");
            gameState.score += 5;
        }
        
        // 적 추가
        function addEnemy() {
            enemies.push({
                x: canvas.width,
                y: Math.random() * (canvas.height - 50),
                size: 25,
                speed: 2 + Math.random() * 3,
                color: '#E74C3C'
            });
            showStatus("👹 적이 나타났다!");
        }
        
        // 스피드업
        function speedUp() {
            gameState.speed += 0.5;
            showStatus("⚡ 더 빨라졌어요!");
            gameState.score += 10;
        }
        
        // 게임 리셋
        function reset() {
            gameState = { score: 0, speed: 1, running: true };
            enemies = [];
            particles = [];
            hero = { x: 50, y: 200, size: 30, color: '#FF6B6B', targetX: 50, targetY: 200 };
            showStatus("🔄 새로 시작!");
        }
        
        // 파티클 생성
        function createParticles(x, y, color) {
            for (let i = 0; i < 8; i++) {
                particles.push({
                    x: x,
                    y: y,
                    vx: (Math.random() - 0.5) * 10,
                    vy: (Math.random() - 0.5) * 10,
                    life: 20,
                    color: color
                });
            }
        }
        
        // 클릭 이벤트
        canvas.addEventListener('click', (e) => {
            const rect = canvas.getBoundingClientRect();
            hero.targetX = e.clientX - rect.left - hero.size/2;
            hero.targetY = e.clientY - rect.top - hero.size/2;
            gameState.score += 1;
            showStatus("👍 이동 중!");
            
            // 클릭 파티클
            createParticles(hero.targetX, hero.targetY, hero.color);
        });
        
        // 키보드 이벤트
        document.addEventListener('keydown', (e) => {
            switch(e.key) {
                case 'ArrowLeft':
                    hero.targetX = Math.max(0, hero.x - 50);
                    break;
                case 'ArrowRight':
                    hero.targetX = Math.min(canvas.width - hero.size, hero.x + 50);
                    break;
                case 'ArrowUp':
                    hero.targetY = Math.max(0, hero.y - 50);
                    break;
                case 'ArrowDown':
                    hero.targetY = Math.min(canvas.height - hero.size, hero.y + 50);
                    break;
                case ' ':
                    createParticles(hero.x, hero.y, hero.color);
                    gameState.score += 2;
                    break;
            }
        });
        
        // 업데이트
        function update() {
            // 주인공 이동 (부드럽게)
            hero.x += (hero.targetX - hero.x) * 0.1;
            hero.y += (hero.targetY - hero.y) * 0.1;
            
            // 적 이동
            enemies.forEach((enemy, index) => {
                enemy.x -= enemy.speed * gameState.speed;
                
                // 화면 밖으로 나가면 제거
                if (enemy.x < -enemy.size) {
                    enemies.splice(index, 1);
                    gameState.score += 3;
                }
                
                // 충돌 체크
                const dx = hero.x - enemy.x;
                const dy = hero.y - enemy.y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < hero.size/2 + enemy.size/2) {
                    // 충돌! 적 제거하고 점수 획득
                    enemies.splice(index, 1);
                    createParticles(enemy.x, enemy.y, '#FFD700');
                    gameState.score += 20;
                    showStatus("💥 적을 물리쳤다!");
                }
            });
            
            // 파티클 업데이트
            particles.forEach((particle, index) => {
                particle.x += particle.vx;
                particle.y += particle.vy;
                particle.life--;
                
                if (particle.life <= 0) {
                    particles.splice(index, 1);
                }
            });
            
            // 자동으로 적 생성
            if (Math.random() < 0.02 * gameState.speed) {
                addEnemy();
            }
        }
        
        // 그리기
        function draw() {
            // 배경 그라데이션
            const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
            gradient.addColorStop(0, '#87CEEB');
            gradient.addColorStop(1, '#98FB98');
            ctx.fillStyle = gradient;
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            // 구름 효과
            ctx.fillStyle = 'rgba(255, 255, 255, 0.8)';
            for (let i = 0; i < 3; i++) {
                const x = (Date.now() * 0.01 + i * 200) % (canvas.width + 100);
                ctx.beginPath();
                ctx.arc(x, 50 + i * 30, 20, 0, Math.PI * 2);
                ctx.fill();
            }
            
            // 주인공 (그림자 효과)
            ctx.fillStyle = 'rgba(0, 0, 0, 0.2)';
            ctx.fillRect(hero.x + 3, hero.y + 3, hero.size, hero.size);
            
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
            
            // 주인공 눈
            ctx.fillStyle = 'white';
            ctx.fillRect(hero.x + 5, hero.y + 8, 8, 8);
            ctx.fillRect(hero.x + hero.size - 13, hero.y + 8, 8, 8);
            ctx.fillStyle = 'black';
            ctx.fillRect(hero.x + 7, hero.y + 10, 4, 4);
            ctx.fillRect(hero.x + hero.size - 11, hero.y + 10, 4, 4);
            
            // 적들
            enemies.forEach(enemy => {
                ctx.fillStyle = enemy.color;
                ctx.fillRect(enemy.x, enemy.y, enemy.size, enemy.size);
                
                // 적 눈
                ctx.fillStyle = 'red';
                ctx.fillRect(enemy.x + 5, enemy.y + 5, 4, 4);
                ctx.fillRect(enemy.x + enemy.size - 9, enemy.y + 5, 4, 4);
            });
            
            // 파티클
            particles.forEach(particle => {
                ctx.fillStyle = particle.color;
                ctx.globalAlpha = particle.life / 20;
                ctx.fillRect(particle.x, particle.y, 3, 3);
            });
            ctx.globalAlpha = 1;
        }
        
        // 게임 루프
        function gameLoop() {
            update();
            draw();
            requestAnimationFrame(gameLoop);
        }
        
        // 시작!
        showStatus("🎮 게임 준비 완료!");
        gameLoop();
        
        // 자동으로 첫 번째 적 생성
        setTimeout(() => {
            addEnemy();
            showStatus("화살표키나 클릭으로 이동하세요!");
        }, 2000);
    </script>
</body>
</html>
```

## 📋 긴급 상황 대응 템플릿

### emergency-template.html (최소 버전)
```html
<!DOCTYPE html>
<html>
<head><title>긴급 게임</title></head>
<body style="background: black; color: white; text-align: center; padding: 50px;">
    <h1>🎮 긴급 게임</h1>
    <canvas id="game" width="400" height="300" style="border: 2px solid white;"></canvas>
    <p>클릭하면 색이 바뀝니다!</p>
    
    <script>
        const canvas = document.getElementById('game');
        const ctx = canvas.getContext('2d');
        
        let color = 'red';
        
        function draw() {
            ctx.fillStyle = color;
            ctx.fillRect(50, 50, 100, 100);
        }
        
        canvas.onclick = function() {
            const colors = ['red', 'blue', 'green', 'yellow', 'purple'];
            color = colors[Math.floor(Math.random() * colors.length)];
            draw();
        };
        
        draw();
    </script>
</body>
</html>
```

## 🔧 긴급 상황 대응 가이드

### 인터넷이 안 될 때
1. `basic-game-standalone.html` 사용
2. 파일을 더블클릭으로 직접 실행
3. 모든 기능이 오프라인으로 작동

### Cursor가 안 될 때
1. 메모장(Windows) 또는 TextEdit(Mac) 사용
2. 템플릿 코드를 복사-붙여넣기
3. 파일명을 `.html`로 저장

### 브라우저가 안 될 때
1. 다른 브라우저 시도 (Edge, Safari, Firefox)
2. 파일을 바탕화면에 놓고 브라우저로 드래그
3. 브라우저 주소창에 `file://` + 파일 경로

## 📦 코드 조각 라이브러리

### 움직임 코드 (movement.js)
```javascript
// 복사해서 <script> 태그 안에 붙여넣기
hero.speed = 5;

document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft') hero.x -= hero.speed;
    if (e.key === 'ArrowRight') hero.x += hero.speed;
    if (e.key === 'ArrowUp') hero.y -= hero.speed;
    if (e.key === 'ArrowDown') hero.y += hero.speed;
    draw();
});
```

### 점프 코드 (jump.js)
```javascript
// 복사해서 <script> 태그 안에 붙여넣기
hero.velocityY = 0;
hero.isJumping = false;

function jump() {
    if (!hero.isJumping) {
        hero.velocityY = -15;
        hero.isJumping = true;
    }
}

function updateJump() {
    hero.velocityY += 0.8; // 중력
    hero.y += hero.velocityY;
    
    if (hero.y > 300) { // 바닥
        hero.y = 300;
        hero.velocityY = 0;
        hero.isJumping = false;
    }
}

// 스페이스바로 점프
document.addEventListener('keydown', function(e) {
    if (e.key === ' ') jump();
});
```

이제 인터넷이 없어도, Cursor가 고장나도, 아이들이 게임을 만들 수 있습니다! 🎮
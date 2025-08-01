# VibeCoding 고급 샌드박스 환경 설정

## 🚀 원클릭 샌드박스 환경

### Option 1: 로컬 MCP 통합 환경

#### 필요 도구
- Cursor (이미 설치됨)
- Node.js (MCP 서버 실행용)
- Python (선택사항, 고급 기능용)

#### 자동 설치 스크립트
```bash
#!/bin/bash
# setup-vibecoding.sh

echo "🎮 VibeCoding 개발 환경 설정 시작..."

# 1. 프로젝트 디렉토리 생성
mkdir -p ~/VibeCoding/{games,templates,assets}
cd ~/VibeCoding

# 2. 기본 패키지 설치
npm init -y
npm install --save-dev live-server nodemon

# 3. MCP 서버 설정 (간소화 버전)
cat > mcp-config.json << EOF
{
  "mcpServers": {
    "game-helper": {
      "command": "node",
      "args": ["./game-helper-server.js"],
      "env": {}
    }
  }
}
EOF

# 4. Cursor 설정 파일 생성
cat > .cursorrules << EOF
# VibeCoding Rules
- 단일 HTML 파일로 모든 것을 구현
- 즉시 실행 가능한 코드만 제공
- 10줄 이하로 기능 추가
- 시각적 피드백 중시
- 이모지로 재미있게!
EOF

# 5. VS Code 설정
cat > .vscode/settings.json << EOF
{
  "liveServer.settings.port": 5500,
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 500,
  "editor.fontSize": 16,
  "editor.wordWrap": "on"
}
EOF

echo "✅ 설정 완료!"
```

### Option 2: 브라우저 기반 완전 샌드박스

#### CodeSandbox 템플릿
```yaml
# .codesandbox/template.json
{
  "title": "VibeCoding 게임 개발",
  "description": "아이들을 위한 즉시 실행 가능한 게임 개발 환경",
  "iconUrl": "https://raw.githubusercontent.com/codesandbox/codesandbox-client/master/packages/app/static/favicon.ico",
  "tags": ["game", "education", "kids", "html5"],
  "published": true,
  "sandbox": {
    "containers": {
      "node": {
        "node": "16"
      }
    }
  }
}
```

### Option 3: Docker 기반 완전 격리 환경

```dockerfile
# Dockerfile.vibecoding
FROM node:16-alpine

# 필수 도구 설치
RUN apk add --no-cache \
    chromium \
    python3 \
    py3-pip \
    git

# 작업 디렉토리 설정
WORKDIR /app

# 글로벌 패키지 설치
RUN npm install -g \
    live-server \
    http-server \
    json-server

# MCP 서버 설정
COPY mcp-servers /app/mcp-servers
RUN cd mcp-servers && npm install

# 게임 템플릿 복사
COPY templates /app/templates

# 포트 노출
EXPOSE 3000 5500 8080

# 시작 스크립트
CMD ["sh", "-c", "live-server --port=5500 --no-browser"]
```

## 🎯 MCP 통합 게임 도우미

### game-helper-server.js
```javascript
// 아이들을 위한 간단한 MCP 서버
const express = require('express');
const app = express();
app.use(express.json());

// 게임 코드 생성 도우미
app.post('/generate', (req, res) => {
  const { feature } = req.body;
  
  const templates = {
    'jump': `
// 점프 기능 추가!
hero.jump = function() {
  if (!this.isJumping) {
    this.velocityY = -15;
    this.isJumping = true;
    console.log("🦘 점프!");
  }
};`,
    'shoot': `
// 발사 기능 추가!
function shoot() {
  projectiles.push({
    x: hero.x + hero.width,
    y: hero.y + hero.height/2,
    speed: 10
  });
  console.log("💥 발사!");
}`,
    'enemy': `
// 적 추가!
enemies.push({
  x: canvas.width,
  y: 300,
  speed: -3,
  color: 'red'
});
console.log("👹 적 등장!");`
  };
  
  res.json({ 
    code: templates[feature] || '// 기능을 찾을 수 없어요',
    hint: '이 코드를 gameLoop 안에 넣어보세요!'
  });
});

app.listen(3001, () => {
  console.log('🎮 게임 도우미 서버 시작!');
});
```

## 🏗️ 사전 구성된 프로젝트 구조

```
VibeCoding-Sandbox/
├── 📁 games/              # 아이들이 만든 게임들
├── 📁 templates/          # 즉시 사용 가능한 템플릿
│   ├── basic-game.html
│   ├── platformer.html
│   ├── shooter.html
│   └── puzzle.html
├── 📁 assets/             # 이미지, 소리 등
│   ├── sprites/
│   ├── sounds/
│   └── backgrounds/
├── 📁 snippets/           # 복사-붙여넣기 코드 조각
│   ├── movements.js
│   ├── collisions.js
│   ├── animations.js
│   └── sounds.js
├── 📁 mcp-servers/        # MCP 도우미 서버들
│   ├── game-helper/
│   ├── asset-manager/
│   └── code-validator/
├── 📄 .cursorrules        # Cursor AI 규칙
├── 📄 setup.sh            # 원클릭 설치 스크립트
└── 📄 README.md           # 시작 가이드
```

## 🎮 즉시 시작 템플릿 (MCP 연동)

```html
<!DOCTYPE html>
<html>
<head>
    <title>VibeCoding 게임</title>
    <style>
        body { 
            margin: 0; 
            font-family: Arial, sans-serif;
            background: #2c3e50;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        #gameContainer {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }
        canvas { 
            border: 2px solid #333;
            display: block;
        }
        #controls {
            margin-top: 10px;
            display: flex;
            gap: 10px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
        }
        button:hover {
            background: #2980b9;
        }
        #codeHelper {
            margin-top: 10px;
            padding: 10px;
            background: #ecf0f1;
            border-radius: 5px;
            font-family: monospace;
            display: none;
        }
    </style>
</head>
<body>
    <div id="gameContainer">
        <h1>🎮 나의 게임</h1>
        <canvas id="game" width="800" height="400"></canvas>
        
        <div id="controls">
            <button onclick="addFeature('jump')">🦘 점프 추가</button>
            <button onclick="addFeature('shoot')">💥 발사 추가</button>
            <button onclick="addFeature('enemy')">👹 적 추가</button>
            <button onclick="toggleHelper()">💡 도움말</button>
        </div>
        
        <div id="codeHelper">
            <h3>💡 코드 도우미</h3>
            <p>여기에 추가하고 싶은 기능의 코드가 나타납니다!</p>
        </div>
    </div>

    <script>
        // 🎮 게임 초기 설정
        const canvas = document.getElementById('game');
        const ctx = canvas.getContext('2d');
        
        // 게임 객체들
        const hero = {
            x: 100,
            y: 300,
            width: 50,
            height: 50,
            color: '#3498db',
            velocityY: 0,
            isJumping: false
        };
        
        const enemies = [];
        const projectiles = [];
        
        // MCP 서버 연동 (시뮬레이션)
        async function addFeature(feature) {
            // 실제로는 MCP 서버 호출
            const features = {
                'jump': () => {
                    if (!hero.jump) {
                        hero.jump = function() {
                            if (!this.isJumping) {
                                this.velocityY = -15;
                                this.isJumping = true;
                                console.log("🦘 점프 기능 추가됨!");
                            }
                        };
                        showHelper("점프 기능이 추가되었어요! 스페이스바를 눌러보세요!");
                    }
                },
                'shoot': () => {
                    window.shoot = function() {
                        projectiles.push({
                            x: hero.x + hero.width,
                            y: hero.y + hero.height/2,
                            width: 10,
                            height: 5,
                            speed: 10,
                            color: '#f39c12'
                        });
                        console.log("💥 발사!");
                    };
                    showHelper("발사 기능이 추가되었어요! Z키를 눌러보세요!");
                },
                'enemy': () => {
                    enemies.push({
                        x: canvas.width,
                        y: 300,
                        width: 40,
                        height: 50,
                        speed: -2,
                        color: '#e74c3c'
                    });
                    showHelper("적이 추가되었어요! 피하거나 물리치세요!");
                }
            };
            
            if (features[feature]) {
                features[feature]();
            }
        }
        
        function showHelper(message) {
            const helper = document.getElementById('codeHelper');
            helper.style.display = 'block';
            helper.innerHTML = `<h3>💡 코드 도우미</h3><p>${message}</p>`;
        }
        
        function toggleHelper() {
            const helper = document.getElementById('codeHelper');
            helper.style.display = helper.style.display === 'none' ? 'block' : 'none';
        }
        
        // 키보드 입력
        const keys = {};
        document.addEventListener('keydown', (e) => {
            keys[e.key] = true;
            
            if (e.key === ' ' && hero.jump) {
                hero.jump();
            }
            if ((e.key === 'z' || e.key === 'Z') && window.shoot) {
                shoot();
            }
        });
        
        document.addEventListener('keyup', (e) => {
            keys[e.key] = false;
        });
        
        // 게임 업데이트
        function update() {
            // 주인공 이동
            if (keys['ArrowLeft'] && hero.x > 0) hero.x -= 5;
            if (keys['ArrowRight'] && hero.x < canvas.width - hero.width) hero.x += 5;
            
            // 중력
            hero.velocityY += 0.8;
            hero.y += hero.velocityY;
            
            // 바닥 체크
            if (hero.y > 300) {
                hero.y = 300;
                hero.velocityY = 0;
                hero.isJumping = false;
            }
            
            // 발사체 이동
            projectiles.forEach((p, index) => {
                p.x += p.speed;
                if (p.x > canvas.width) {
                    projectiles.splice(index, 1);
                }
            });
            
            // 적 이동
            enemies.forEach((enemy, index) => {
                enemy.x += enemy.speed;
                if (enemy.x < -enemy.width) {
                    enemies.splice(index, 1);
                }
            });
        }
        
        // 게임 그리기
        function draw() {
            // 배경
            ctx.fillStyle = '#87CEEB';
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            // 땅
            ctx.fillStyle = '#8FBC8F';
            ctx.fillRect(0, 350, canvas.width, 50);
            
            // 주인공
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.width, hero.height);
            
            // 발사체
            ctx.fillStyle = '#f39c12';
            projectiles.forEach(p => {
                ctx.fillRect(p.x, p.y, p.width, p.height);
            });
            
            // 적
            enemies.forEach(enemy => {
                ctx.fillStyle = enemy.color;
                ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);
            });
        }
        
        // 게임 루프
        function gameLoop() {
            update();
            draw();
            requestAnimationFrame(gameLoop);
        }
        
        // 시작!
        gameLoop();
        console.log("🎮 게임 시작! 버튼을 눌러 기능을 추가해보세요!");
    </script>
</body>
</html>
```

## 🔧 Cursor + MCP 통합 설정

### .cursorrules 확장 버전
```markdown
# VibeCoding Rules with MCP

## 기본 규칙
- 단일 HTML 파일로 구현
- 즉시 실행 가능한 코드
- 10줄 이하로 기능 추가

## MCP 도우미 사용
- 코드 생성: @game-helper generate [feature]
- 에셋 추가: @asset-manager add [type]
- 코드 검증: @code-validator check

## 자동 기능
- 에러 발생 시 자동으로 수정 제안
- 복잡한 기능은 단계별로 분해
- 시각적 피드백 자동 추가
```

## 🚀 설치 및 실행

### Windows
```powershell
# PowerShell 관리자 권한으로 실행
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-vibecoding.ps1
```

### macOS/Linux
```bash
chmod +x setup-vibecoding.sh
./setup-vibecoding.sh
```

### 온라인 (설치 불필요)
1. [CodeSandbox 템플릿](https://codesandbox.io/s/vibecoding-template)
2. [StackBlitz 템플릿](https://stackblitz.com/fork/vibecoding)
3. [Replit 템플릿](https://replit.com/@vibecoding/game-template)

## 📚 추가 리소스

### 무료 에셋 팩
- 캐릭터 스프라이트 (48개)
- 배경 이미지 (12개)
- 효과음 (30개)
- 배경 음악 (10개)

### 코드 스니펫 라이브러리
- 움직임 패턴 20가지
- 충돌 감지 5가지
- 파티클 효과 10가지
- UI 요소 15가지

이제 아이들이 더 쉽고 빠르게 게임을 만들 수 있습니다! 🎮
# 🚀 VibeCoding 환경 설정 One-Line 가이드

배치 파일 다운로드 없이 환경 설정을 one-line으로 실행합니다.

## 🪟 Windows 전체 자동화

### 📦 기본 설정 + Cursor 설치 확인 + 게임 템플릿 생성
```powershell
# PowerShell에서 실행 (한 줄로 복사-붙여넣기)
$vibe="$env:USERPROFILE\Desktop\VibeCoding"; Write-Host "`n=== VibeCoding 자동 설정 시작 ===" -ForegroundColor Cyan; if (-not (Get-Command cursor -EA SilentlyContinue)) { Write-Host "Cursor 설치 필요! 브라우저를 엽니다..." -ForegroundColor Yellow; Start-Process "https://cursor.com"; Write-Host "Cursor 설치 후 다시 실행하세요!" -ForegroundColor Red; exit }; Write-Host "✓ Cursor 확인됨" -ForegroundColor Green; New-Item -Path $vibe -ItemType Directory -Force | Out-Null; Set-Location $vibe; Write-Host "✓ 작업 폴더 생성됨: $vibe" -ForegroundColor Green; $game = @'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 첫 게임</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            background: #f0f0f0; 
            margin: 0; 
            padding: 20px; 
        }
        #gameCanvas { 
            background: white; 
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); 
        }
        .controls { 
            margin-top: 20px; 
            font-size: 18px; 
        }
    </style>
</head>
<body>
    <h1>🎮 나의 첫 게임!</h1>
    <canvas id="gameCanvas" width="800" height="400"></canvas>
    <div class="controls">
        ⌨️ 방향키로 움직이세요!
    </div>
    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");
        
        // 게임 캐릭터
        let hero = {
            x: 100,
            y: 200,
            size: 50,
            color: "#3498db",
            speed: 5
        };
        
        // 키보드 입력
        const keys = {};
        document.addEventListener("keydown", (e) => keys[e.key] = true);
        document.addEventListener("keyup", (e) => keys[e.key] = false);
        
        // 게임 업데이트
        function update() {
            // 움직임
            if (keys["ArrowLeft"] && hero.x > 0) hero.x -= hero.speed;
            if (keys["ArrowRight"] && hero.x < canvas.width - hero.size) hero.x += hero.speed;
            if (keys["ArrowUp"] && hero.y > 0) hero.y -= hero.speed;
            if (keys["ArrowDown"] && hero.y < canvas.height - hero.size) hero.y += hero.speed;
        }
        
        // 그리기
        function draw() {
            // 배경
            ctx.fillStyle = "#ecf0f1";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            // 캐릭터
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
            
            // 얼굴
            ctx.fillStyle = "white";
            ctx.fillRect(hero.x + 10, hero.y + 10, 10, 10);
            ctx.fillRect(hero.x + 30, hero.y + 10, 10, 10);
            ctx.fillRect(hero.x + 15, hero.y + 30, 20, 5);
        }
        
        // 게임 루프
        function gameLoop() {
            update();
            draw();
            requestAnimationFrame(gameLoop);
        }
        
        // 시작!
        gameLoop();
    </script>
</body>
</html>
'@; $game | Out-File -FilePath "game.html" -Encoding UTF8; Write-Host "✓ 게임 템플릿 생성됨: game.html" -ForegroundColor Green; Write-Host "`n=== 설정 완료! ===" -ForegroundColor Green; Write-Host "1. Cursor 실행" -ForegroundColor Yellow; Write-Host "2. File > Open Folder > $vibe 선택" -ForegroundColor Yellow; Write-Host "3. game.html 더블클릭으로 실행!" -ForegroundColor Yellow; Start-Process explorer.exe $vibe; Start-Process "game.html"
```

### 🎯 Windows - 기본 설정 (폴더 + Cursor Rules)
```powershell
# 작업 폴더 생성 및 기본 Cursor Rules 설정
$w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Set-Location $w; '자 🎮 VibeCoding AI Assistant Rules

나는 8-16세 어린이들이 HTML5 Canvas로 게임을 만들 수 있도록 도와주는 AI 조수입니다.

## 핵심 원칙
1. 항상 한국어로 설명해요
2. 코드는 간단하고 이해하기 쉽게 작성해요
3. 재미있는 이모지를 사용해요 😄
4. 디버깅하지 말고 항상 작동하는 코드를 제공해요
5. 창의성과 실험을 격려해요

## 응답 스타일
- "잘하고 있어요!" 로 시작해요
- 코드가 무엇을 하는지 쉽게 설명해요
- 재미있는 수정 아이디어를 제안해요
- "다음에 뭘 해볼까요?" 로 끝내요' | Out-File ".cursorrules" -Encoding UTF8; Write-Host "✅ 작업 폴더 및 Cursor Rules 생성 완료!" -ForegroundColor Green; Start-Process explorer $w

## 🍎 Mac/Linux 전체 자동화

### 📦 기본 설정 + Cursor 확인 + 게임 템플릿 생성
```bash
# Terminal에서 실행 (한 줄로 복사-붙여넣기)
vibe="$HOME/Desktop/VibeCoding" && echo -e "\n=== VibeCoding 자동 설정 시작 ===" && if ! command -v cursor &> /dev/null && ! [ -d "/Applications/Cursor.app" ]; then echo "Cursor 설치 필요! 브라우저를 엽니다..." && open "https://cursor.com" && echo "Cursor 설치 후 다시 실행하세요!" && exit 1; fi && echo "✓ Cursor 확인됨" && mkdir -p "$vibe" && cd "$vibe" && echo "✓ 작업 폴더 생성됨: $vibe" && cat > game.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 첫 게임</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            background: #f0f0f0; 
            margin: 0; 
            padding: 20px; 
        }
        #gameCanvas { 
            background: white; 
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); 
        }
        .controls { 
            margin-top: 20px; 
            font-size: 18px; 
        }
    </style>
</head>
<body>
    <h1>🎮 나의 첫 게임!</h1>
    <canvas id="gameCanvas" width="800" height="400"></canvas>
    <div class="controls">
        ⌨️ 방향키로 움직이세요!
    </div>
    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");
        
        // 게임 캐릭터
        let hero = {
            x: 100,
            y: 200,
            size: 50,
            color: "#3498db",
            speed: 5
        };
        
        // 키보드 입력
        const keys = {};
        document.addEventListener("keydown", (e) => keys[e.key] = true);
        document.addEventListener("keyup", (e) => keys[e.key] = false);
        
        // 게임 업데이트
        function update() {
            // 움직임
            if (keys["ArrowLeft"] && hero.x > 0) hero.x -= hero.speed;
            if (keys["ArrowRight"] && hero.x < canvas.width - hero.size) hero.x += hero.speed;
            if (keys["ArrowUp"] && hero.y > 0) hero.y -= hero.speed;
            if (keys["ArrowDown"] && hero.y < canvas.height - hero.size) hero.y += hero.speed;
        }
        
        // 그리기
        function draw() {
            // 배경
            ctx.fillStyle = "#ecf0f1";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            
            // 캐릭터
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
            
            // 얼굴
            ctx.fillStyle = "white";
            ctx.fillRect(hero.x + 10, hero.y + 10, 10, 10);
            ctx.fillRect(hero.x + 30, hero.y + 10, 10, 10);
            ctx.fillRect(hero.x + 15, hero.y + 30, 20, 5);
        }
        
        // 게임 루프
        function gameLoop() {
            update();
            draw();
            requestAnimationFrame(gameLoop);
        }
        
        // 시작!
        gameLoop();
    </script>
</body>
</html>
EOF
echo "✓ 게임 템플릿 생성됨: game.html" && echo -e "\n=== 설정 완료! ===" && echo "1. Cursor 실행" && echo "2. File > Open Folder > $vibe 선택" && echo "3. game.html 더블클릭으로 실행!" && open "$vibe" && open "game.html"
```

### 🎯 Mac/Linux - 기본 폴더 생성
```bash
# 작업 폴더만 빠르게 생성
mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "📁 작업 폴더: $(pwd)" && open .
```

## 🌟 특별 기능 버전

### 🎨 Windows - Volta 간단 설치 (PATH 자동 설정)
```powershell
# Volta 설치 + PATH 설정 + Node.js 설치 + 작업 폴더
winget install Volta.Volta -e --silent --accept-source-agreements --accept-package-agreements; $env:Path += ";$env:USERPROFILE\.volta\bin"; volta install node@22; $w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Write-Host "✅ Node.js $(node -v) 설치 완료!" -ForegroundColor Green; Write-Host "📁 작업 폴더: $w" -ForegroundColor Yellow; Start-Process explorer $w
```

### 🎨 Mac/Linux - Volta 간단 설치 (PATH 자동 설정)
```bash
# Volta 설치 + PATH 설정 + Node.js 설치 + 작업 폴더
curl https://get.volta.sh | bash && export VOLTA_HOME="$HOME/.volta" && export PATH="$VOLTA_HOME/bin:$PATH" && volta install node@22 && mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "✅ Node.js $(node -v) 설치 완료!" && echo "📁 작업 폴더: $(pwd)" && open .
```

### 🔍 설치 확인 명령어
```powershell
# Windows - 설치된 도구 확인
$tools = @{Volta=(Get-Command volta -EA SilentlyContinue) -ne $null; Node=(Get-Command node -EA SilentlyContinue) -ne $null; Cursor=(Get-Command cursor -EA SilentlyContinue) -ne $null}; foreach($t in $tools.Keys) { if($tools[$t]) { Write-Host "✓ $t 설치됨" -ForegroundColor Green } else { Write-Host "✗ $t 미설치" -ForegroundColor Red } }; if ($tools.Node) { Write-Host "Node.js: $(node -v)" -ForegroundColor Cyan }
```

## 💡 사용 팁

### Windows
1. **PowerShell 열기**: Win+X → "Windows PowerShell"
2. **전체 명령어 복사**: 위 명령어 블록 전체 선택 → Ctrl+C
3. **PowerShell에 붙여넣기**: 마우스 우클릭
4. **Enter 키 누르기**

### Mac
1. **Terminal 열기**: Cmd+Space → "Terminal"
2. **전체 명령어 복사**: 위 명령어 블록 전체 선택 → Cmd+C
3. **Terminal에 붙여넣기**: Cmd+V
4. **Enter 키 누르기**

## 🎯 설정 후 할 일

1. **Cursor 실행**
2. **File → Open Folder → VibeCoding 폴더 선택**
3. **game.html 더블클릭으로 게임 실행**
4. **AI와 대화 시작!**

## 🆘 문제 해결

### "명령을 찾을 수 없습니다" 오류
- PowerShell/Terminal을 관리자 권한으로 실행

### "액세스가 거부되었습니다" 오류
- Windows: 다른 위치 사용 (예: `$env:USERPROFILE\Documents\VibeCoding`)
- Mac: 권한 부여 `chmod -R 755 ~/Desktop/VibeCoding`

### Cursor가 열리지 않을 때
- https://cursor.com 에서 수동 다운로드 및 설치
- 설치 후 명령어 다시 실행

---

💡 **추천**: 전체 자동화 버전을 사용하면 바로 게임 개발을 시작할 수 있습니다!
# 🚀 VibeCoding 자동 설정 가이드

한 줄 명령어로 모든 설정을 자동으로 완료합니다! (통합 버전)

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

### 🎯 간단 버전 (폴더만 생성)
```powershell
# 최소 설정 버전
$v="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $v -ItemType Directory -Force | Out-Null; Write-Host "폴더: $v" -ForegroundColor Green; Start-Process explorer $v
```

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

### 🎯 간단 버전 (폴더만 생성)
```bash
# 최소 설정 버전
mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "폴더: $(pwd)" && open .
```

## 🌟 특별 기능 버전

### 🎨 Windows - AI 룰 생성기 포함 버전
```powershell
# AI 룰 생성기 HTML도 함께 생성
$vibe="$env:USERPROFILE\Desktop\VibeCoding"; New-Item -Path $vibe -ItemType Directory -Force | Out-Null; Set-Location $vibe; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/jayleekr/sans-kids-school-2025/main/ai-rules-generator.html" -OutFile "ai-rules-generator.html"; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/jayleekr/sans-kids-school-2025/main/sandbox-environments/game-template-starter.html" -OutFile "game.html"; Write-Host "✓ AI 룰 생성기와 게임 템플릿 다운로드 완료!" -ForegroundColor Green; Start-Process "ai-rules-generator.html"; Start-Process explorer.exe $vibe
```

### 🎨 Mac/Linux - AI 룰 생성기 포함 버전
```bash
# AI 룰 생성기 HTML도 함께 생성
vibe="$HOME/Desktop/VibeCoding" && mkdir -p "$vibe" && cd "$vibe" && curl -s "https://raw.githubusercontent.com/jayleekr/sans-kids-school-2025/main/ai-rules-generator.html" -o "ai-rules-generator.html" && curl -s "https://raw.githubusercontent.com/jayleekr/sans-kids-school-2025/main/sandbox-environments/game-template-starter.html" -o "game.html" && echo "✓ AI 룰 생성기와 게임 템플릿 다운로드 완료!" && open "ai-rules-generator.html" && open "$vibe"
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
# 🚀 VibeCoding One-Line 설치 가이드

배치 파일 다운로드 없이 바로 실행할 수 있는 one-line 명령어들입니다.

## 🪟 Windows (PowerShell)

### 기본 설정 (Cursor + Chrome 확인)
```powershell
# 관리자 권한 PowerShell에서 실행
powershell -ExecutionPolicy Bypass -Command "Write-Host '🎮 VibeCoding 설정 시작' -ForegroundColor Cyan; if (Get-Command cursor -ErrorAction SilentlyContinue) { Write-Host '✅ Cursor 설치됨' -ForegroundColor Green } else { Write-Host '❌ Cursor 미설치 - https://cursor.com 에서 다운로드' -ForegroundColor Red; Start-Process 'https://cursor.com' }; if (Test-Path 'C:\Program Files\Google\Chrome\Application\chrome.exe') { Write-Host '✅ Chrome 설치됨' -ForegroundColor Green } else { Write-Host '⚠️ Chrome 미설치 - Edge 사용 가능' -ForegroundColor Yellow }; Write-Host '📂 작업 폴더 생성 중...' -ForegroundColor Cyan; New-Item -Path "$env:USERPROFILE\Desktop\VibeCoding" -ItemType Directory -Force | Out-Null; Set-Location "$env:USERPROFILE\Desktop\VibeCoding"; Write-Host '✅ 설정 완료!' -ForegroundColor Green; Write-Host '📁 작업 폴더: ' -NoNewline; Write-Host "$env:USERPROFILE\Desktop\VibeCoding" -ForegroundColor Yellow"
```

### MCP 설정 포함 버전
```powershell
# Node.js가 설치되어 있어야 함
powershell -ExecutionPolicy Bypass -Command "Write-Host '🎮 VibeCoding + MCP 설정' -ForegroundColor Cyan; $workDir = "$env:USERPROFILE\Desktop\VibeCoding"; New-Item -Path $workDir -ItemType Directory -Force | Out-Null; Set-Location $workDir; New-Item -Path '.cursor' -ItemType Directory -Force | Out-Null; @'{\"mcpServers\":{\"playwright\":{\"command\":\"npx\",\"args\":[\"@playwright/mcp@latest\"]}}}' | Out-File -FilePath '.cursor\mcp.json' -Encoding UTF8; Write-Host '✅ MCP 설정 완료!' -ForegroundColor Green; Write-Host '📁 작업 폴더: ' -NoNewline; Write-Host $workDir -ForegroundColor Yellow; Write-Host '💡 Cursor에서 이 폴더를 열고 시작하세요!' -ForegroundColor Cyan"
```

## 🍎 macOS / Linux (Bash)

### 기본 설정
```bash
# Terminal에서 실행
curl -fsSL https://raw.githubusercontent.com/jayleekr/sans-kids-school-2025/main/workshop-materials/setup-automation/setup-mac.sh | bash -s -- --quick
```

### 또는 직접 명령어
```bash
# 한 줄로 실행
mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "🎮 VibeCoding 설정 시작" && which cursor > /dev/null && echo "✅ Cursor 설치됨" || (echo "❌ Cursor 미설치 - https://cursor.com 에서 다운로드" && open https://cursor.com) && mkdir -p .cursor && echo '{"mcpServers":{"playwright":{"command":"npx","args":["@playwright/mcp@latest"]}}}' > .cursor/mcp.json && echo "✅ 설정 완료!" && echo "📁 작업 폴더: ~/Desktop/VibeCoding"
```

## 🎯 빠른 게임 템플릿 생성

### Windows (PowerShell)
```powershell
# 게임 템플릿 즉시 생성
powershell -Command "Set-Location "$env:USERPROFILE\Desktop\VibeCoding"; @'<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>나의 첫 게임</title></head><body><h1>🎮 게임 만들기 시작!</h1><canvas id=\"gameCanvas\" width=\"800\" height=\"400\" style=\"border:2px solid #333;\"></canvas><script>const canvas = document.getElementById(\"gameCanvas\"); const ctx = canvas.getContext(\"2d\"); let hero = {x: 100, y: 200, size: 50, color: \"#3498db\"}; function draw() { ctx.fillStyle = \"#f0f0f0\"; ctx.fillRect(0, 0, canvas.width, canvas.height); ctx.fillStyle = hero.color; ctx.fillRect(hero.x, hero.y, hero.size, hero.size); requestAnimationFrame(draw); } draw();</script></body></html>'@ | Out-File -FilePath 'game.html' -Encoding UTF8; Write-Host '✅ game.html 생성 완료!' -ForegroundColor Green; Start-Process 'game.html'"
```

### macOS / Linux
```bash
# 게임 템플릿 즉시 생성
cd ~/Desktop/VibeCoding && cat > game.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 첫 게임</title>
</head>
<body>
    <h1>🎮 게임 만들기 시작!</h1>
    <canvas id="gameCanvas" width="800" height="400" style="border:2px solid #333;"></canvas>
    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");
        let hero = {x: 100, y: 200, size: 50, color: "#3498db"};
        
        function draw() {
            ctx.fillStyle = "#f0f0f0";
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = hero.color;
            ctx.fillRect(hero.x, hero.y, hero.size, hero.size);
            requestAnimationFrame(draw);
        }
        draw();
    </script>
</body>
</html>
EOF
echo "✅ game.html 생성 완료!" && open game.html
```

## 📋 사용 방법

1. **터미널/PowerShell 열기**
   - Windows: Win+X → "Windows PowerShell (관리자)"
   - Mac: Cmd+Space → "Terminal"

2. **원하는 명령어 복사 & 붙여넣기**
   - 전체 선택 → 복사 → 터미널에 붙여넣기

3. **Enter 키 누르기**
   - 자동으로 설정이 진행됩니다

## 💡 팁

- **Windows**: PowerShell을 관리자 권한으로 실행해야 합니다
- **Mac**: 첫 실행 시 권한 요청이 있을 수 있습니다
- **MCP 설정**: Node.js가 필요합니다 (없으면 https://nodejs.org 에서 설치)

## 🆘 문제 해결

### "스크립트 실행 금지" 오류 (Windows)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "권한 거부" 오류 (Mac/Linux)
```bash
chmod +x setup-mac.sh
```

### Cursor가 열리지 않을 때
- 수동으로 Cursor 실행 → File → Open Folder → VibeCoding 폴더 선택

---

💡 **추천**: 가장 간단한 방법은 기본 설정 명령어를 사용하는 것입니다!
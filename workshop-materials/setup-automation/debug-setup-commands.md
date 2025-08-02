# 🐛 VibeCoding Setup Debug Commands

PowerShell 오류 디버깅을 위한 상세 명령어들입니다.

## 🔍 문제 분석

스크린샷의 오류를 보면 다음과 같은 문제들이 발생할 수 있습니다:
1. PowerShell 실행 정책 문제
2. 이스케이프 문자 처리 문제
3. 인코딩 문제 (UTF-8 BOM)
4. 경로 또는 권한 문제

## 🪟 Windows 디버그 명령어

### 1단계: PowerShell 실행 정책 확인
```powershell
# 현재 실행 정책 확인
Get-ExecutionPolicy -List
```

### 2단계: 실행 정책 설정 (필요시)
```powershell
# 현재 사용자에 대해 실행 정책 변경
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### 3단계: 단계별 디버그 명령어

#### A. 작업 디렉토리 생성 테스트
```powershell
# 변수 설정 및 디렉토리 생성
$workDir = "$env:USERPROFILE\Desktop\VibeCoding"
Write-Host "작업 디렉토리: $workDir" -ForegroundColor Yellow

# 디렉토리 존재 확인
if (Test-Path $workDir) {
    Write-Host "디렉토리가 이미 존재합니다" -ForegroundColor Green
} else {
    Write-Host "디렉토리를 생성합니다..." -ForegroundColor Cyan
    New-Item -Path $workDir -ItemType Directory -Force
}

# 디렉토리로 이동
Set-Location $workDir
Write-Host "현재 위치: $(Get-Location)" -ForegroundColor Green
```

#### B. Cursor 설치 확인 (상세 버전)
```powershell
# Cursor 경로 확인
Write-Host "`n=== Cursor 설치 확인 ===" -ForegroundColor Cyan

# 여러 위치에서 Cursor 찾기
$cursorPaths = @(
    "$env:LOCALAPPDATA\Programs\cursor\Cursor.exe",
    "$env:ProgramFiles\Cursor\Cursor.exe",
    "C:\Users\$env:USERNAME\AppData\Local\Programs\cursor\Cursor.exe"
)

$cursorFound = $false
foreach ($path in $cursorPaths) {
    Write-Host "확인 중: $path" -ForegroundColor Gray
    if (Test-Path $path) {
        Write-Host "✅ Cursor 발견: $path" -ForegroundColor Green
        $cursorFound = $true
        break
    }
}

if (-not $cursorFound) {
    # PATH에서 cursor 명령어 확인
    try {
        $cursorCmd = Get-Command cursor -ErrorAction Stop
        Write-Host "✅ Cursor 명령어 사용 가능: $($cursorCmd.Source)" -ForegroundColor Green
        $cursorFound = $true
    } catch {
        Write-Host "❌ Cursor가 설치되지 않았습니다" -ForegroundColor Red
        Write-Host "https://cursor.com 에서 다운로드하세요" -ForegroundColor Yellow
    }
}
```

#### C. MCP 설정 파일 생성 (디버그 버전)
```powershell
# .cursor 디렉토리 생성
Write-Host "`n=== MCP 설정 시작 ===" -ForegroundColor Cyan

$cursorDir = Join-Path $workDir ".cursor"
Write-Host "Cursor 설정 디렉토리: $cursorDir" -ForegroundColor Gray

if (-not (Test-Path $cursorDir)) {
    New-Item -Path $cursorDir -ItemType Directory -Force | Out-Null
    Write-Host "✅ .cursor 디렉토리 생성됨" -ForegroundColor Green
} else {
    Write-Host "✅ .cursor 디렉토리 이미 존재" -ForegroundColor Green
}

# MCP 설정 JSON 생성
$mcpConfig = @{
    mcpServers = @{
        playwright = @{
            command = "npx"
            args = @("@playwright/mcp@latest")
        }
    }
}

$mcpJsonPath = Join-Path $cursorDir "mcp.json"

try {
    $mcpConfig | ConvertTo-Json -Depth 10 | Out-File -FilePath $mcpJsonPath -Encoding UTF8
    Write-Host "✅ MCP 설정 파일 생성됨: $mcpJsonPath" -ForegroundColor Green
    
    # 파일 내용 확인
    Write-Host "`n생성된 MCP 설정:" -ForegroundColor Cyan
    Get-Content $mcpJsonPath | Write-Host -ForegroundColor Gray
} catch {
    Write-Host "❌ MCP 설정 파일 생성 실패: $_" -ForegroundColor Red
}
```

### 4단계: 전체 통합 명령어 (안전 버전)

```powershell
# 안전한 one-line 명령어 (복사해서 사용)
$w="$env:USERPROFILE\Desktop\VibeCoding"; try { New-Item -Path $w -ItemType Directory -Force -EA Stop | Out-Null; Write-Host "OK: VibeCoding 폴더 생성 완료 - $w" -ForegroundColor Green; Start-Process explorer.exe $w } catch { Write-Host "ERROR: $_" -ForegroundColor Red }
```

### 5단계: 게임 템플릿 생성 (디버그 버전)
```powershell
# 현재 위치 확인
Write-Host "`n=== 게임 템플릿 생성 ===" -ForegroundColor Cyan
Write-Host "현재 위치: $(Get-Location)" -ForegroundColor Gray

# HTML 템플릿 생성
$gameTemplate = @'
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
'@

try {
    $gameTemplate | Out-File -FilePath "game.html" -Encoding UTF8
    Write-Host "✅ game.html 생성 완료!" -ForegroundColor Green
    
    # 파일 존재 확인
    if (Test-Path "game.html") {
        $fileInfo = Get-Item "game.html"
        Write-Host "파일 크기: $($fileInfo.Length) bytes" -ForegroundColor Gray
        Write-Host "파일 경로: $($fileInfo.FullName)" -ForegroundColor Gray
    }
} catch {
    Write-Host "❌ 파일 생성 실패: $_" -ForegroundColor Red
}
```

## 🍎 macOS/Linux 디버그 명령어

### 단계별 실행
```bash
# 1. 작업 디렉토리 생성
echo "=== 작업 디렉토리 생성 ==="
mkdir -pv ~/Desktop/VibeCoding
cd ~/Desktop/VibeCoding
pwd

# 2. Cursor 설치 확인
echo -e "\n=== Cursor 설치 확인 ==="
if command -v cursor &> /dev/null; then
    echo "✅ Cursor 설치됨: $(which cursor)"
else
    echo "❌ Cursor 미설치"
    echo "다음 위치 확인 중..."
    ls -la /Applications/Cursor.app 2>/dev/null || echo "Cursor.app 없음"
fi

# 3. MCP 설정
echo -e "\n=== MCP 설정 ==="
mkdir -pv .cursor
cat > .cursor/mcp.json << 'EOF'
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
EOF
echo "✅ MCP 설정 완료"
cat .cursor/mcp.json

# 4. 권한 확인
echo -e "\n=== 권한 확인 ==="
ls -la .cursor/
```

## 🔧 일반적인 문제 해결

### Windows PowerShell 오류
1. **"스크립트를 실행할 수 없습니다"**
   ```powershell
   # 관리자 권한 PowerShell에서 실행
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
   ```

2. **"경로를 찾을 수 없습니다"**
   ```powershell
   # 수동으로 디렉토리 생성
   mkdir $env:USERPROFILE\Desktop\VibeCoding -Force
   cd $env:USERPROFILE\Desktop\VibeCoding
   ```

3. **"액세스가 거부되었습니다"**
   - PowerShell을 관리자 권한으로 실행
   - Windows 키 → "PowerShell" 검색 → 우클릭 → "관리자 권한으로 실행"

### macOS/Linux 권한 오류
```bash
# 권한 부여
chmod -R 755 ~/Desktop/VibeCoding
```

## 📊 시스템 정보 수집 (문제 보고용)
```powershell
# Windows
Write-Host "=== 시스템 정보 ===" -ForegroundColor Cyan
Write-Host "OS: $([System.Environment]::OSVersion.VersionString)"
Write-Host "PowerShell: $($PSVersionTable.PSVersion)"
Write-Host "사용자: $env:USERNAME"
Write-Host "홈 디렉토리: $env:USERPROFILE"
Write-Host "현재 실행 정책: $(Get-ExecutionPolicy)"
```

---

💡 **팁**: 각 단계를 개별적으로 실행하여 어느 부분에서 오류가 발생하는지 확인하세요!
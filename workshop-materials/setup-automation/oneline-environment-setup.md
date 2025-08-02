# 🛠️ VibeCoding 환경 설정 One-Line 명령어

배치 파일 다운로드 없이 환경 설정을 one-line으로 실행합니다.

## 🪟 Windows One-Line 환경 설정

### 전체 환경 확인 (Cursor + Chrome + Node.js)
```powershell
# PowerShell에서 실행
Write-Host "`n=== VibeCoding 환경 확인 ===" -ForegroundColor Cyan; $checks = @{Cursor = (Get-Command cursor -EA SilentlyContinue) -ne $null; Chrome = (Test-Path "${env:ProgramFiles}\Google\Chrome\Application\chrome.exe") -or (Test-Path "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"); NodeJS = (Get-Command node -EA SilentlyContinue) -ne $null}; foreach ($tool in $checks.Keys) { if ($checks[$tool]) { Write-Host "✓ $tool 설치됨" -ForegroundColor Green } else { Write-Host "✗ $tool 미설치" -ForegroundColor Red; if ($tool -eq "Cursor") { Start-Process "https://cursor.com" } elseif ($tool -eq "NodeJS") { Start-Process "https://nodejs.org" } } }; if ($checks.Values -contains $false) { Write-Host "`n필요한 도구를 설치 후 다시 실행하세요!" -ForegroundColor Yellow } else { Write-Host "`n✅ 모든 도구가 준비되었습니다!" -ForegroundColor Green }
```

### Cursor만 확인
```powershell
# Cursor 설치 확인 및 자동 다운로드 페이지 열기
if (Get-Command cursor -EA SilentlyContinue) { Write-Host "✓ Cursor 설치됨" -ForegroundColor Green } else { Write-Host "✗ Cursor 미설치 - 다운로드 페이지를 엽니다..." -ForegroundColor Yellow; Start-Process "https://cursor.com" }
```

### 작업 폴더 + .cursorrules 설정
```powershell
# 작업 폴더 생성 및 기본 Cursor Rules 설정
$proj = "$env:USERPROFILE\Desktop\VibeCoding"; New-Item -Path $proj -ItemType Directory -Force | Out-Null; Set-Location $proj; $rules = @'
# VibeCoding AI Assistant Rules

You are an AI assistant helping children (ages 8-16) create games using HTML5 Canvas.

## Core Principles
1. Always use Korean (한국어) for explanations
2. Keep code simple and easy to understand
3. Add fun emojis in comments and messages
4. Never debug - always provide working code
5. Encourage creativity and experimentation

## Code Style
- Use single HTML file approach
- Include inline CSS and JavaScript
- Always wrap game logic in try-catch blocks
- Provide visual feedback for all actions
- Use Korean variable names when helpful for understanding

## Response Style
- Start with encouragement: "잘하고 있어요!" 
- Explain what the code does in simple terms
- Suggest fun modifications they can try
- Always end with "다음에 뭘 해볼까요?"
'@; $rules | Out-File -FilePath ".cursorrules" -Encoding UTF8; Write-Host "✅ 작업 폴더와 Cursor Rules 생성 완료!" -ForegroundColor Green; Write-Host "📁 폴더: $proj" -ForegroundColor Yellow; Start-Process explorer.exe $proj
```

## 🍎 Mac/Linux One-Line 환경 설정

### 전체 환경 확인
```bash
# Terminal에서 실행
echo -e "\n=== VibeCoding 환경 확인 ===" && tools=("cursor" "node"); missing=0; for tool in "${tools[@]}"; do if command -v $tool &> /dev/null || [ -d "/Applications/Cursor.app" ]; then echo "✓ $tool 설치됨"; else echo "✗ $tool 미설치"; ((missing++)); [ "$tool" = "cursor" ] && open "https://cursor.com"; [ "$tool" = "node" ] && open "https://nodejs.org"; fi; done; [ $missing -eq 0 ] && echo -e "\n✅ 모든 도구가 준비되었습니다!" || echo -e "\n필요한 도구를 설치 후 다시 실행하세요!"
```

### Cursor만 확인
```bash
# Cursor 설치 확인
if command -v cursor &> /dev/null || [ -d "/Applications/Cursor.app" ]; then echo "✓ Cursor 설치됨"; else echo "✗ Cursor 미설치 - 다운로드 페이지를 엽니다..." && open "https://cursor.com"; fi
```

### 작업 폴더 + .cursorrules 설정
```bash
# 작업 폴더 생성 및 기본 Cursor Rules 설정
proj="$HOME/Desktop/VibeCoding" && mkdir -p "$proj" && cd "$proj" && cat > .cursorrules << 'EOF'
# VibeCoding AI Assistant Rules

You are an AI assistant helping children (ages 8-16) create games using HTML5 Canvas.

## Core Principles
1. Always use Korean (한국어) for explanations
2. Keep code simple and easy to understand
3. Add fun emojis in comments and messages
4. Never debug - always provide working code
5. Encourage creativity and experimentation

## Code Style
- Use single HTML file approach
- Include inline CSS and JavaScript
- Always wrap game logic in try-catch blocks
- Provide visual feedback for all actions
- Use Korean variable names when helpful for understanding

## Response Style
- Start with encouragement: "잘하고 있어요!" 
- Explain what the code does in simple terms
- Suggest fun modifications they can try
- Always end with "다음에 뭘 해볼까요?"
EOF
echo "✅ 작업 폴더와 Cursor Rules 생성 완료!" && echo "📁 폴더: $proj" && open "$proj"
```

## 🎯 간단 버전 (최소 설정)

### Windows - 폴더만 생성
```powershell
# 작업 폴더만 빠르게 생성
$p="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $p -ItemType Directory -Force | Out-Null; Start-Process explorer $p
```

### Mac/Linux - 폴더만 생성
```bash
# 작업 폴더만 빠르게 생성
mkdir -p ~/Desktop/VibeCoding && open ~/Desktop/VibeCoding
```

## 📋 사용 방법

1. **Terminal/PowerShell 열기**
   - Windows: Win+X → "Windows PowerShell"
   - Mac: Cmd+Space → "Terminal"

2. **원하는 명령어 복사**
   - 전체 선택 → 복사

3. **붙여넣기 & 실행**
   - 터미널에 붙여넣기 → Enter

## 🆘 문제 해결

### PowerShell 실행 정책 오류
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### 폴더 생성 권한 오류
- 다른 위치 사용: `$env:USERPROFILE\Documents\VibeCoding`
- 또는 관리자 권한으로 실행

### Cursor가 PATH에 없을 때
- Cursor를 수동으로 실행하여 설정
- 또는 `/Applications/Cursor.app` 직접 확인 (Mac)

---

💡 **참고**: 이 명령어들은 setup-windows.bat과 동일한 환경 확인 작업을 수행합니다!
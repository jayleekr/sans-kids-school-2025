# 🔧 PowerShell 오류 해결 가이드

## 문제: here-string 오류

사용자가 겪고 있는 오류:
```
here-string 헤더 뒤에는 문자가 허용되지 않지만 줄 끝 앞에는 허용됩니다.
```

이는 PowerShell의 here-string (`@'...'@`) 문법 때문입니다.

## 해결책: 안전한 One-Line 명령어

### 1. 가장 간단한 버전 (폴더 생성만)
```powershell
$w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Write-Host "폴더 생성: $w" -ForegroundColor Green; Start-Process explorer $w
```

### 2. Cursor 확인 포함 버전
```powershell
if (Get-Command cursor -EA SilentlyContinue) { Write-Host "✓ Cursor OK" -ForegroundColor Green } else { Write-Host "✗ Cursor 미설치" -ForegroundColor Red; Start-Process "https://cursor.com" }; $w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Start-Process explorer $w
```

### 3. .cursorrules 파일 생성 (여러 줄로 실행)
```powershell
# 1단계: 폴더 생성
$w="$env:USERPROFILE\Desktop\VibeCoding"
New-Item $w -ItemType Directory -Force | Out-Null
Set-Location $w

# 2단계: Cursor Rules 파일 생성
@'
# VibeCoding AI Assistant Rules

You are an AI assistant helping children (ages 8-16) create games.

## Core Principles
1. Always use Korean for explanations
2. Keep code simple and easy to understand
3. Add fun emojis in comments
4. Never debug - always provide working code
5. Encourage creativity

## Response Style
- Start with "잘하고 있어요!"
- Explain what the code does simply
- Suggest fun modifications
- End with "다음에 뭘 해볼까요?"
'@ | Out-File ".cursorrules" -Encoding UTF8

Write-Host "✅ 설정 완료!" -ForegroundColor Green
Start-Process explorer $w
```

## 💡 권장 사항

**MCP 관련 설정은 모두 제거되었습니다.** VibeCoding v1.1.0부터는 MCP를 사용하지 않으므로, 단순한 폴더 생성과 Cursor 확인만으로 충분합니다.

가장 안전하고 간단한 방법은 **"1. 가장 간단한 버전"**을 사용하는 것입니다!
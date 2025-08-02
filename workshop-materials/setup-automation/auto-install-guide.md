# 🚀 VibeCoding 완전 자동 설치 가이드

Volta를 통한 Node.js 자동 설치를 포함한 완전 자동화 명령어입니다. Volta는 더 빠르고 안정적인 Node.js 버전 관리 도구입니다.

## 🪟 Windows 완전 자동 설치

### 1️⃣ 관리자 권한 PowerShell 실행
- Win+X → "Windows PowerShell (관리자)" 선택
- 또는 Windows 검색 → "PowerShell" → 우클릭 → "관리자 권한으로 실행"

### 2️⃣ 완전 자동 설치 (Chocolatey + Node.js + Cursor 확인 + 작업 폴더)

#### 전체 통합 명령어
```powershell
# 관리자 권한 PowerShell에서 실행 (한 줄로 복사-붙여넣기)
if (!(Get-Command choco -EA SilentlyContinue)) { Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); Write-Host "Chocolatey 설치 완료!" -ForegroundColor Green } else { Write-Host "Chocolatey 이미 설치됨" -ForegroundColor Green }; refreshenv; if (!(Get-Command node -EA SilentlyContinue)) { choco install nodejs-lts -y --no-progress; Write-Host "Node.js 설치 완료!" -ForegroundColor Green } else { Write-Host "Node.js 이미 설치됨: $(node -v)" -ForegroundColor Green }; if (!(Get-Command cursor -EA SilentlyContinue)) { Write-Host "Cursor 설치 필요!" -ForegroundColor Yellow; Start-Process "https://cursor.com" } else { Write-Host "Cursor 설치됨" -ForegroundColor Green }; $w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Write-Host "`n✅ 모든 설치 완료!" -ForegroundColor Green; Write-Host "📁 작업 폴더: $w" -ForegroundColor Yellow; Start-Process explorer $w
```

#### 단계별 실행 (문제 해결용)

**Step 1: Chocolatey 설치**
```powershell
# Chocolatey가 없으면 설치
if (!(Get-Command choco -EA SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Write-Host "✅ Chocolatey 설치 완료!" -ForegroundColor Green
} else {
    Write-Host "✅ Chocolatey 이미 설치됨" -ForegroundColor Green
}
```

**Step 2: Node.js 설치**
```powershell
# 환경 변수 새로고침
refreshenv

# Node.js가 없으면 설치
if (!(Get-Command node -EA SilentlyContinue)) {
    choco install nodejs-lts -y --no-progress
    Write-Host "✅ Node.js 설치 완료!" -ForegroundColor Green
    refreshenv
} else {
    Write-Host "✅ Node.js 이미 설치됨: $(node -v)" -ForegroundColor Green
}
```

**Step 3: Cursor 확인 및 작업 폴더 생성**
```powershell
# Cursor 확인
if (!(Get-Command cursor -EA SilentlyContinue)) {
    Write-Host "⚠️ Cursor 설치 필요!" -ForegroundColor Yellow
    Start-Process "https://cursor.com"
} else {
    Write-Host "✅ Cursor 설치됨" -ForegroundColor Green
}

# 작업 폴더 생성
$w="$env:USERPROFILE\Desktop\VibeCoding"
New-Item $w -ItemType Directory -Force | Out-Null
Write-Host "📁 작업 폴더: $w" -ForegroundColor Yellow
Start-Process explorer $w
```

### 3️⃣ 설치 확인 명령어
```powershell
# 모든 도구 버전 확인
Write-Host "`n=== 설치된 도구 확인 ===" -ForegroundColor Cyan
choco -v
node -v  
npm -v
if (Get-Command cursor -EA SilentlyContinue) { Write-Host "Cursor: OK" } else { Write-Host "Cursor: 미설치" -ForegroundColor Red }
```

## 🍎 Mac 자동 설치

### Homebrew를 통한 자동 설치
```bash
# Terminal에서 실행
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install node && mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "✅ 설치 완료! Node.js: $(node -v)" && open ~/Desktop/VibeCoding
```

## 📋 설치 후 확인사항

### Windows
- Chocolatey: `choco -v`
- Node.js: `node -v` (v22.x.x 이상)
- npm: `npm -v` (10.x.x 이상)
- Cursor: 수동으로 https://cursor.com 에서 다운로드

### Mac
- Homebrew: `brew -v`
- Node.js: `node -v`
- npm: `npm -v`
- Cursor: App Store 또는 https://cursor.com 에서 다운로드

## 🆘 문제 해결

### "권한이 거부되었습니다" 오류
- PowerShell을 관리자 권한으로 실행했는지 확인
- `Set-ExecutionPolicy Bypass -Force` 실행

### "choco를 찾을 수 없습니다" 오류
- PowerShell을 재시작한 후 다시 시도
- 또는 `refreshenv` 명령 실행

### Node.js 설치 후에도 "node를 찾을 수 없습니다"
```powershell
# 환경 변수 수동 새로고침
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```

### Chocolatey 설치가 차단될 때
1. Windows Defender 실시간 보호 일시 중지
2. 설치 진행
3. 설치 완료 후 실시간 보호 다시 활성화

## 💡 추천 설치 순서

1. **관리자 권한 PowerShell 실행**
2. **전체 통합 명령어 실행**
3. **Cursor 수동 설치** (필요시)
4. **설치 확인 명령어로 검증**

---

✨ **참고**: 이 자동 설치는 Windows의 Chocolatey 패키지 관리자를 사용합니다. 기업 환경에서는 IT 정책을 확인하세요.
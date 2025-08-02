# 🔧 Volta 설치 오류 해결 가이드

## 문제: "volta가 인식되지 않습니다"

Volta 설치 후 이런 오류가 발생하는 이유:
```
volta : 'volta' 용어가 cmdlet, 함수, 스크립트 파일 또는 실행할 수 있는 프로그램 이름으로 인식되지 않습니다.
```

### 원인
- Windows가 Volta 설치 후 PATH 환경 변수를 현재 PowerShell 세션에 즉시 반영하지 않음
- Volta는 `%USERPROFILE%\.volta\bin`에 설치되지만, 현재 세션은 이를 인식하지 못함

## 해결 방법

### 방법 1: PowerShell 재시작 (권장)
```powershell
# 1. PowerShell을 완전히 닫기
# 2. 새 PowerShell 창을 관리자 권한으로 열기
# 3. 다시 실행:
volta install node@22
node -v
```

### 방법 2: 환경 변수 즉시 적용
```powershell
# 현재 세션에 Volta 경로 추가
$env:Path += ";$env:USERPROFILE\.volta\bin"

# 이제 volta 명령어 사용 가능
volta install node@22
node -v
```

### 방법 3: 시스템 재부팅
- 가장 확실한 방법이지만 시간이 오래 걸림
- 모든 환경 변수가 완전히 적용됨

## 🚀 VibeCoding One-Line 설치 (Volta 버전)

### Windows - 완전 자동화 (Volta + Node.js + 작업 폴더)
```powershell
# 관리자 권한 PowerShell에서 실행
winget install Volta.Volta -e --silent; $env:Path += ";$env:USERPROFILE\.volta\bin"; volta install node@22; if (!(Get-Command cursor -EA SilentlyContinue)) { Start-Process "https://cursor.com" }; $w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item $w -ItemType Directory -Force | Out-Null; Write-Host "✅ 설치 완료! Node.js: $(node -v)" -ForegroundColor Green; Write-Host "📁 작업 폴더: $w" -ForegroundColor Yellow; Start-Process explorer $w
```

### 단계별 설치 (문제 해결용)

**Step 1: Volta 설치**
```powershell
# winget으로 Volta 설치
winget install Volta.Volta -e --silent

# 환경 변수 즉시 적용
$env:Path += ";$env:USERPROFILE\.volta\bin"

# Volta 확인
volta --version
```

**Step 2: Node.js 설치**
```powershell
# Node.js 22 LTS 설치
volta install node@22

# 버전 확인
node -v  # v22.x.x가 출력되어야 함
npm -v   # 10.x.x가 출력되어야 함
```

**Step 3: Cursor 확인 및 작업 폴더**
```powershell
# Cursor 확인
if (!(Get-Command cursor -EA SilentlyContinue)) {
    Write-Host "Cursor 설치 페이지를 엽니다..." -ForegroundColor Yellow
    Start-Process "https://cursor.com"
}

# 작업 폴더 생성
$w="$env:USERPROFILE\Desktop\VibeCoding"
New-Item $w -ItemType Directory -Force | Out-Null
Write-Host "📁 작업 폴더: $w" -ForegroundColor Green
Start-Process explorer $w
```

## 💡 Volta의 장점

1. **빠른 설치**: Chocolatey보다 빠름
2. **버전 관리**: 프로젝트별로 다른 Node.js 버전 사용 가능
3. **자동 전환**: 폴더별로 Node.js 버전 자동 전환
4. **가벼움**: 최소한의 시스템 리소스 사용

## 🆘 추가 문제 해결

### winget이 없는 경우
```powershell
# Microsoft Store에서 "앱 설치 관리자" 업데이트
# 또는 수동으로 Volta 다운로드:
Start-Process "https://github.com/volta-cli/volta/releases"
```

### 권한 문제
```powershell
# 실행 정책 변경
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

### PATH 영구 적용
```powershell
# 시스템 환경 변수에 Volta 경로 추가
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:USERPROFILE\.volta\bin", [EnvironmentVariableTarget]::User)
```

---

✨ **팁**: PowerShell을 재시작하는 것이 가장 간단한 해결 방법입니다!
# SANS Kids VibeCoding: AI와 함께하는 어린이 게임 개발 워크샵

<p align="center">
  <img src="https://img.shields.io/badge/SANS_Kids-VibeCoding-ff6b6b.svg" alt="SANS Kids">
  <img src="https://img.shields.io/badge/Ages-8--16-brightgreen.svg" alt="Ages 8-16">
  <img src="https://img.shields.io/badge/Tool-Cursor_AI-blue.svg" alt="Cursor AI">
  <img src="https://img.shields.io/badge/Language-Korean-orange.svg" alt="Korean">
  <img src="https://img.shields.io/badge/Platform-Web-yellow.svg" alt="Web">
</p>

## 🎮 프로젝트 소개

SANS Kids VibeCoding은 SANS Kids에서 개발한 AI 협업 게임 개발 교육 프로그램입니다. 8-16세 어린이들이 AI(Cursor)와 함께 게임을 만들며, **코딩을 배우지 않고도** 자신만의 게임을 만들 수 있습니다. 

**핵심 가치**: 코드를 작성하는 것이 아니라 **"문제 설정, 분해, AI 관리 능력"** 을 기릅니다.

### 🌟 핵심 특징

- **디버깅 없는 개발**: 에러가 나도 게임은 계속 실행됩니다
- **즉각적인 피드백**: 저장 → 자동 새로고침 → 10초 내 결과 확인
- **단일 HTML 파일**: 복잡한 빌드 과정 없이 바로 실행
- **5가지 AI 선생님**: 다양한 학습 스타일에 맞춘 AI 페르소나

## 🚀 빠른 시작

### 방법 1: Release 다운로드 (Git 없이! 추천 👍)
1. [Releases 페이지](https://github.com/jayleekr/sans-kids-school-2025/releases)에서 최신 버전 다운로드
2. ZIP 파일 압축 해제
3. `start-workshop.bat` (Windows) 또는 `start-workshop.sh` (Mac) 실행
4. Cursor에서 폴더 열기

### 방법 2: One-Line 설치 (다운로드 없이! 🚀)

#### Windows (PowerShell) - 환경 확인 포함
```powershell
# 복사해서 PowerShell에 붙여넣기 (Cursor 확인 + 작업 폴더 생성)
if (Get-Command cursor -EA SilentlyContinue) { Write-Host "✓ Cursor 설치됨" -ForegroundColor Green } else { Write-Host "✗ Cursor 미설치 - 다운로드 페이지를 엽니다..." -ForegroundColor Yellow; Start-Process "https://cursor.com" }; $w="$env:USERPROFILE\Desktop\VibeCoding"; New-Item -Path $w -ItemType Directory -Force | Out-Null; Write-Host "📁 작업 폴더: $w" -ForegroundColor Green; Start-Process explorer.exe $w
```

#### Mac/Linux (Terminal) - 환경 확인 포함
```bash
# 복사해서 Terminal에 붙여넣기 (Cursor 확인 + 작업 폴더 생성)
if command -v cursor &> /dev/null || [ -d "/Applications/Cursor.app" ]; then echo "✓ Cursor 설치됨"; else echo "✗ Cursor 미설치" && open "https://cursor.com"; fi; mkdir -p ~/Desktop/VibeCoding && cd ~/Desktop/VibeCoding && echo "📁 작업 폴더: ~/Desktop/VibeCoding" && open ~/Desktop/VibeCoding
```

더 많은 설정 옵션이 필요하신가요? 👉 [환경 설정 가이드](workshop-materials/setup-automation/oneline-environment-setup.md)

### 방법 3: Git Clone (개발자용)
```bash
git clone https://github.com/jayleekr/sans-kids-school-2025.git
cd sans-kids-school-2025
```

필요한 도구:
- Cursor (AI 코드 에디터) - https://cursor.com
- 웹 브라우저 (Chrome, Edge, Safari 등)

### 2. 게임 개발 시작

1. **AI와 대화 시작하기** (2가지 방법):
   - **방법 A (추천)**: `instant-start-prompts.md`에서 적합한 프롬프트 복사 → Cursor에 붙여넣기
   - **방법 B (고급)**: AI 룰 생성기로 맞춤 설정 후 시작

2. **템플릿 열기**: `sandbox-environments/game-template-starter.html`
   - 모든 연령대가 동일한 템플릿으로 시작
   - AI와의 대화를 통해 복잡도 조절

3. **실행 방법**:
   - HTML 파일을 브라우저로 열기 (더블클릭 또는 드래그)
   - 또는 Cursor에서 Live Server 확장 사용

4. **개발 사이클**: 대화 → 코드 생성 → 저장(Ctrl+S) → 자동 새로고침 → 결과 확인

## 📚 프로젝트 구조

```
├── workflows/                    # 5가지 AI 교육 접근법
│   ├── workflow-1-friendly-teacher/    # 격려 중심
│   ├── workflow-2-problem-solver/      # 문제 해결 중심
│   ├── workflow-3-quick-implementation/ # 빠른 구현
│   ├── workflow-4-storytelling/        # 스토리텔링
│   └── workflow-5-checklist/           # 체계적 접근
│
├── sandbox-environments/         # 개발 템플릿과 도구
├── workshop-materials/          # 진행자 가이드와 자동화
└── evaluation/                  # 평가 기준
```

## 🎮 게임 데모 화면

### Workflow 1: 친근한 선생님 - 바나나 히어로
![Workflow 1 Demo](images/workflows/workflow-1-demo.png)
*격려와 칭찬으로 아이들의 자신감을 키우는 접근법*

### Workflow 2: 문제 해결자 - 탐험가의 모험
![Workflow 2 Demo](images/workflows/workflow-2-demo.png)
*소크라테스식 문답법으로 스스로 해결책을 찾도록 유도*

### Workflow 3: 빠른 구현 - 액션 게임
![Workflow 3 Demo](images/workflows/workflow-3-demo.png)
*즉각적인 결과물을 통한 성취감 중심 접근*

### Workflow 4: 스토리텔링 - 모험 이야기
![Workflow 4 Demo](images/workflows/workflow-4-demo.png)
*이야기와 함께 코드를 배우는 몰입형 학습*

### Workflow 5: 체크리스트 - 프로젝트 관리
![Workflow 5 Demo](images/workflows/workflow-5-demo.png)
*체계적인 단계별 접근으로 복잡한 프로젝트 완성*

## 🎯 표준 테스트 게임: "바나나 히어로의 모험"

모든 워크플로우를 테스트하는 기본 게임:
- 날아다니는 원숭이 히어로 (키보드 이동)
- 바나나 던지기 (Z키)
- 바나나에 미끄러지는 적들
- 점수 시스템
- 간단한 물리 엔진 (점프, 중력)

## 🤖 AI와 함께하는 게임 개발

VibeCoding의 핵심은 **코딩을 배우는 것이 아니라 AI와 협업하는 방법을 배우는 것**입니다.

### 아이들이 배우는 것:
- 🎯 **문제 정의하기**: "바나나를 던지는 원숭이 게임을 만들고 싶어"
- 🧩 **문제 분해하기**: "원숭이가 움직여야 하고, 바나나를 던질 수 있어야 해"
- 🤝 **AI와 소통하기**: "원숭이가 더 빨리 움직이게 해줘"
- 🔄 **반복 개선하기**: "점수가 화면에 크게 보이면 좋겠어"

### 아이들이 배우지 않아도 되는 것:
- ❌ HTML/CSS/JavaScript 문법
- ❌ 프로그래밍 구조
- ❌ 디버깅 방법
- ❌ 코드 작성

**대신 아이들은 자신의 아이디어를 AI에게 전달하고, 원하는 결과를 얻는 방법을 익힙니다.**

## 💬 아이들을 위한 AI 프롬프트 가이드

AI와 효과적으로 대화하는 방법을 배워요! 

### 🎭 재미있는 AI 친구 만들기
- 게임지니, 코드마법사, 게임봇 3000, 코딩펭귄 등 다양한 AI 캐릭터
- 나만의 특별한 관계 설정하기
- AI를 친구처럼 대하는 방법

### 📚 연령별 맞춤 프롬프트
- **8-10세**: 쉽고 재미있는 마법 주문처럼!
- **11-13세**: 논리적이고 단계별로!
- **14-16세**: 전문가처럼 체계적으로!

### 🎯 상황별 프롬프트 예시
- 게임 시작할 때
- 기능 추가할 때
- 문제가 생겼을 때
- 완성을 축하할 때

👉 자세한 내용은 [`educational-scenarios/cursor-prompts-for-kids.md`](educational-scenarios/cursor-prompts-for-kids.md)에서 확인하세요!

## 📈 성공 지표

- **완성률**: 80% 이상이 기본 게임 완성
- **기능 구현**: 70%가 움직임 구현, 50%가 추가 기능 구현
- **참여도**: 모든 어린이가 최종 발표 참여
- **만족도**: "다시 하고 싶어요!" 응답

## 🆘 일반적인 문제 해결

### "화면이 안 나와요"
1. 파일 저장 확인 (Ctrl+S)
2. 브라우저 새로고침 (F5)
3. Live Server 재시작
4. **백업**: HTML 파일을 브라우저에서 직접 열기

### "키보드가 안 먹어요"
1. 게임 캔버스 클릭해서 포커스
2. 키 이름 대소문자 확인
3. **백업**: 마우스 클릭 컨트롤로 전환

### "에러가 났어요"
1. **절대 아이들과 디버깅하지 않기**
2. 긍정적 언어 사용: "좋은 발견이야!"
3. 마지막 작동 상태로 되돌리기 (Ctrl+Z)
4. **백업**: 새 템플릿 로드

## 🚫 금지 기술

- Node.js, npm, yarn 등 빌드 도구
- 별도의 CSS/JS 파일
- 서버 기능
- 복잡한 프레임워크 (React, Vue 등)
- 데이터베이스 연결

## 📄 라이선스

이 프로젝트는 SANS Kids 교육 프로그램의 일부로, 교육 목적으로 자유롭게 사용할 수 있습니다.

## 📦 Release 배포

아이들과 부모님을 위한 Release 버전을 제공합니다:
- **Git 설치 불필요**: 모든 필요한 파일이 포함됨
- **즉시 시작 가능**: 다운로드 후 바로 사용
- **크로스 플랫폼**: Windows/Mac 모두 지원

[👉 Release 다운로드](https://github.com/jayleekr/sans-kids-school-2025/releases)

## 👥 Contributors

- Jay Lee
- Jinyong Shin
- Jiwoong Kim

---

<p align="center">
  <strong>🎮 SANS Kids와 함께하는 즐거운 게임 만들기! Happy Coding with AI! 🤖</strong>
</p>
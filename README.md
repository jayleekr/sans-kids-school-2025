# VibeCoding: AI와 함께하는 어린이 게임 개발 워크샵

<p align="center">
  <img src="https://img.shields.io/badge/Ages-8--16-brightgreen.svg" alt="Ages 8-16">
  <img src="https://img.shields.io/badge/Tool-Cursor_AI-blue.svg" alt="Cursor AI">
  <img src="https://img.shields.io/badge/Language-Korean-orange.svg" alt="Korean">
  <img src="https://img.shields.io/badge/Platform-Web-yellow.svg" alt="Web">
</p>

## 🎮 프로젝트 소개

VibeCoding은 8-16세 어린이들이 AI(Cursor)와 협업하여 게임을 만드는 교육 워크샵입니다. 전통적인 프로그래밍 지식 대신 **"문제 설정, 분해, AI 관리 능력"** 을 기릅니다.

### 🌟 핵심 특징

- **디버깅 없는 개발**: 에러가 나도 게임은 계속 실행됩니다
- **즉각적인 피드백**: 저장 → 자동 새로고침 → 10초 내 결과 확인
- **단일 HTML 파일**: 복잡한 빌드 과정 없이 바로 실행
- **5가지 AI 선생님**: 다양한 학습 스타일에 맞춘 AI 페르소나

## 🚀 빠른 시작

### 1. 환경 설정 (최초 1회)

#### Windows
```batch
# 관리자 권한으로 실행
workshop-materials\setup-automation\setup-windows.bat
```

#### Mac/Linux
```bash
chmod +x workshop-materials/setup-automation/setup-mac.sh
./workshop-materials/setup-automation/setup-mac.sh
```

설치 내용:
- VS Code + Cursor
- Live Server 확장
- MCP Playwright (브라우저 자동화)
- 프로젝트 폴더 구조

### 2. 게임 개발 시작

1. **템플릿 선택**:
   - 초급 (8-10세): `sandbox-environments/sandbox-simple-html.html`
   - 중급 (11-13세): `sandbox-environments/sandbox-p5js-template.html`
   - 고급 (14-16세): `sandbox-environments/sandbox-mini-engine.html`

2. **실행 방법**:
   - 방법 1: HTML 파일 우클릭 → "Open with Live Server"
   - 방법 2: `Ctrl+Shift+P` → "MCP: Open Browser" (자동화)

3. **개발 사이클**: 코드 수정 → 저장(Ctrl+S) → 자동 새로고침 → 결과 확인

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

## 🎯 표준 테스트 게임: "바나나 히어로의 모험"

모든 워크플로우를 테스트하는 기본 게임:
- 날아다니는 원숭이 히어로 (키보드 이동)
- 바나나 던지기 (Z키)
- 바나나에 미끄러지는 적들
- 점수 시스템
- 간단한 물리 엔진 (점프, 중력)

## 🛡️ 에러 방지 패턴

```javascript
// 항상 try-catch로 게임 로직 감싸기
function safeGameLoop() {
    try {
        updateGame();
        drawGame();
    } catch (e) {
        showMessage("🔄 다시 시도 중...");
    }
    requestAnimationFrame(safeGameLoop);
}

// 모든 곳에 기본값 사용
const hero = hero || { x: 100, y: 300, size: 50 };

// console.log 대신 시각적 피드백
function showMessage(text) {
    document.getElementById('status').innerText = text;
}
```

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

## 👥 기여하기

워크샵 개선 아이디어나 새로운 게임 템플릿을 환영합니다! 

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 교육 목적으로 자유롭게 사용할 수 있습니다.

## 🙏 감사의 말

- Cursor AI 팀: 어린이 친화적인 AI 도구 제공
- 워크샵 테스터 어린이들: 소중한 피드백
- 교육자 커뮤니티: 지속적인 개선 제안

---

<p align="center">
  <strong>🎮 즐거운 게임 만들기! Happy Coding with AI! 🤖</strong>
</p>
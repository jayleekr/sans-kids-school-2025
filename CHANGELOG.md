# 변경 기록 (Changelog)

## [v1.1.2] - 2025-08-02

### 🎉 새로운 기능
- **One-Line Release 자동 다운로드 명령어**
  - GitHub API를 사용해 최신 Release 자동 감지
  - 자동 다운로드 → 압축 해제 → 실행까지 한 번에
  - Windows PowerShell 및 Mac/Linux Terminal 지원
  - Git 설치 없이도 최신 버전 사용 가능

### 🔧 개선사항
- README.md 설치 방법 재정렬
  - One-Line Release 다운로드를 방법 1로 (가장 추천)
  - 기존 수동 다운로드는 방법 2로
  - 개발 환경 설치는 방법 3으로
  - Git Clone은 방법 4로 (개발자용)

## [v1.1.1] - 2025-08-02

### 🐛 버그 수정
- PowerShell one-line 명령어 이스케이프 문제 수정
- MCP 관련 코드 완전 제거

## [v1.1.0] - 2025-08-02

### 🔄 주요 변경사항
- **MCP (Model Context Protocol) 제거**
  - 모든 MCP 관련 설정과 참조 제거
  - 더 간단한 설치 프로세스
  - 브라우저 직접 실행 방식으로 변경

## [v1.1.0-beta] - 2025-08-02

### 🎉 새로운 기능
- **AI 프롬프트 가이드 추가** 
  - `educational-scenarios/cursor-prompts-for-kids.md` - 아이들을 위한 AI 대화 가이드
  - 연령별 맞춤 프롬프트 시나리오 (8-10세, 11-13세, 14-16세)
  - 재미있는 AI 캐릭터 설정 예시 (게임지니, 코드마법사, 게임봇 3000, 코딩펭귄)
  - 상황별 프롬프트 템플릿

- **One-Line 설치 명령어**
  - 배치 파일 다운로드 없이 바로 실행 가능한 PowerShell/Bash 명령어
  - 더 자세한 디버그 출력과 오류 처리
  - `workshop-materials/setup-automation/debug-setup-commands.md` - 문제 해결 가이드

### 🔧 개선사항
- README.md에 AI 프롬프트 가이드 섹션 추가
- One-line 설치 명령어를 더 안전하고 상세하게 개선
- 오류 처리와 디버깅 정보 강화
- build-release.sh에 educational-scenarios 폴더 포함

### 📚 문서
- `oneline-setup-guide.md` - One-line 설치 상세 가이드
- `debug-setup-commands.md` - 설치 문제 해결을 위한 디버그 명령어

---

## [v1.0.0] - 2025-08-01

### 🚀 첫 릴리즈
- SANS Kids VibeCoding 워크숍 프로그램 공개
- 5가지 AI 교육 워크플로우
- 단일 HTML 파일 기반 게임 개발 환경
- MCP Playwright 통합
- 연령별 최적화된 교육 자료
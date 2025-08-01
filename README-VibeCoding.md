# VibeCoding 워크숍 프로젝트 구조

## 📁 디렉토리 구조

```
VibeCoding-Workshop/
├── workflows/                          # 5가지 워크플로우 스타일
│   ├── workflow-1-friendly-teacher/    # 친절한 선생님 스타일
│   │   └── cursor-rules.md
│   ├── workflow-2-problem-solver/      # 문제 해결 코치 스타일
│   │   └── cursor-rules.md
│   ├── workflow-3-quick-implementation/# 빠른 구현 도우미 스타일
│   │   └── cursor-rules.md
│   ├── workflow-4-storytelling/        # 스토리텔링 개발자 스타일
│   │   └── cursor-rules.md
│   └── workflow-5-checklist/           # 단계별 체크리스트 스타일
│       └── cursor-rules.md
│
├── sandbox-environments/               # 샌드박스 환경 및 템플릿
│   ├── cursor-rules-vibecoding-optimized.md  # 최적화된 Cursor Rules
│   ├── quick-feedback-guide.md               # 빠른 피드백 루프 가이드
│   ├── vibecoding-sandbox-setup.md           # 샌드박스 환경 설정
│   ├── sandbox-simple-html.html              # 순수 HTML/JS (초급)
│   ├── sandbox-p5js-template.html            # p5.js 버전 (중급)
│   └── sandbox-mini-engine.html              # 미니 게임 엔진 (고급)
│
├── workshop-materials/                 # 워크숍 진행 자료
│   ├── workshop.md                     # 원본 워크숍 문서
│   └── expected-questions.md           # 아이들의 예상 질문 40개
│
├── evaluation/                         # 평가 및 분석 자료
│   └── workflow-evaluation-criteria.md # 워크플로우 효과성 평가 기준
│
└── README-VibeCoding.md               # 이 문서

```

## 🎯 사용 방법

### 1. 워크플로우 테스트
1. `workflows/` 폴더에서 테스트할 워크플로우 선택
2. 해당 `cursor-rules.md` 내용을 Cursor의 `.cursorrules` 파일에 복사
3. "바나나 히어로의 모험" 게임 개발 시작
4. `workshop-materials/expected-questions.md`의 질문들로 테스트

### 2. 샌드박스 환경 설정
1. `sandbox-environments/vibecoding-sandbox-setup.md` 참고하여 환경 구성
2. 연령별 적절한 템플릿 선택:
   - 초급(8-10세): `sandbox-simple-html.html`
   - 중급(11-13세): `sandbox-p5js-template.html`
   - 고급(14-16세): `sandbox-mini-engine.html`

### 3. 평가 및 선택
1. `evaluation/workflow-evaluation-criteria.md` 기준으로 평가
2. 가장 효과적인 워크플로우 선정
3. 실제 워크숍에 적용

## 🚀 빠른 시작

```bash
# 1. Cursor에서 새 HTML 파일 생성
# 2. 선택한 템플릿 내용 복사
# 3. Live Server로 실행
# 4. 코드 수정 → 저장 → 즉시 확인!
```

## 💡 핵심 원칙
- **즉시 실행**: 단일 HTML 파일로 바로 실행
- **빠른 피드백**: 저장 즉시 결과 확인 (10초 이내)
- **단순함**: 설치나 빌드 과정 없음
- **재미**: 시각적 피드백과 이모지 활용

## 📊 워크플로우별 특징

| 워크플로우 | 강점 | 적합한 대상 |
|-----------|------|------------|
| 친절한 선생님 | 격려와 칭찬 | 자신감이 부족한 아이 |
| 문제 해결 코치 | 사고력 향상 | 호기심 많은 아이 |
| 빠른 구현 | 즉각적 성과 | 성취감을 원하는 아이 |
| 스토리텔링 | 상상력 자극 | 창의적인 아이 |
| 체크리스트 | 체계적 진행 | 꼼꼼한 아이 |
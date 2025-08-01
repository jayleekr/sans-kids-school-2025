# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VibeCoding is an educational workshop system designed to teach children (ages 8-16) game development using Cursor and AI collaboration. The project emphasizes "problem setting, decomposition, and AI management skills" rather than traditional programming knowledge.

## Core Philosophy

- **No Debugging for Kids**: Children should never need to debug. Games must continue running even with errors.
- **Immediate Feedback**: Code changes should be visible within 10 seconds (save → auto-refresh → see results).
- **Single HTML File Strategy**: All code (HTML, CSS, JavaScript) in one file to eliminate build complexity.
- **Error-Proof Architecture**: Use try-catch blocks, default values, and fail-safe mechanisms.

## Architecture Overview

### Repository Structure
```
├── workflows/                    # 5 teaching approaches (Cursor Rules variants)
│   ├── workflow-1-friendly-teacher/    # Encouragement-focused
│   ├── workflow-2-problem-solver/      # Socratic method
│   ├── workflow-3-quick-implementation/ # Fast results
│   ├── workflow-4-storytelling/        # Narrative-driven
│   └── workflow-5-checklist/           # Systematic approach
├── sandbox-environments/         # Development templates & tools
├── workshop-materials/          # Facilitator guides & automation
└── evaluation/                  # Assessment criteria
```

### Workflow System
The project implements 5 different AI teaching personalities through Cursor Rules files. Each workflow targets different learning styles:
- Ages 8-10: Friendly Teacher or Storytelling
- Ages 11-13: Problem Solver or Checklist  
- Ages 14-16: Quick Implementation or Problem Solver

## Development Commands

### Environment Setup
```bash
# Windows (run as administrator) - Now includes MCP Playwright
workshop-materials/setup-automation/setup-windows.bat

# Mac/Linux - Now includes MCP Playwright
chmod +x workshop-materials/setup-automation/setup-mac.sh
./workshop-materials/setup-automation/setup-mac.sh
```

### MCP Integration
The setup scripts now automatically install and configure MCP Playwright for:
- **Automated browser launching**: `Ctrl+Shift+P` → "MCP: Open Browser"
- **Game testing automation**: AI can automatically test game functions
- **Screenshot capture**: Automatic game progress documentation
- **Enhanced workflow**: Code → Save → MCP auto-test → Visual feedback

### Game Development Workflow
1. **Start with base template**: Use `sandbox-environments/sandbox-simple-html.html`
2. **Launch options**:
   - **Method 1**: Right-click HTML file → "Open with Live Server"
   - **Method 2**: `Ctrl+Shift+P` → "MCP: Open Browser" (automated)
3. **Enhanced development cycle**: Edit code → Save (Ctrl+S) → MCP auto-test → Visual feedback
4. **Screen layout**: Cursor (50%) + Browser (50%) side-by-side

### Testing Workflows
To test different teaching approaches:
1. Copy contents from `workflows/[workflow-name]/cursor-rules.md`
2. Paste into Cursor's `.cursorrules` file
3. Test with game development scenario: "바나나 히어로의 모험" (Banana Hero Adventure)
4. Use questions from `workshop-materials/expected-questions.md`

## Key Technical Constraints

### Required Technologies
- **Single HTML files only** - no separate CSS/JS files
- **Canvas API** for graphics (avoid complex frameworks)
- **Inline styles** and scripts
- **CDN libraries only** (p5.js allowed for intermediate level)

### Forbidden Technologies
- Node.js, npm, yarn, or any build tools
- Separate asset files
- Server-side functionality
- Complex frameworks (React, Vue, etc.)
- Database connections

### Error Prevention Patterns
```javascript
// Always wrap game logic in try-catch
function safeGameLoop() {
    try {
        updateGame();
        drawGame();
    } catch (e) {
        showMessage("🔄 다시 시도 중...");
    }
    requestAnimationFrame(safeGameLoop);
}

// Use default values everywhere
const hero = hero || { x: 100, y: 300, size: 50 };

// Replace console.log with visual feedback
function showMessage(text) {
    document.getElementById('status').innerText = text;
}
```

## Game Template Architecture

### Base Game Structure
Every game follows this pattern:
1. **Canvas setup** (800x400px recommended)
2. **Game state objects** (hero, enemies, projectiles, score)
3. **Input handling** (keyboard events with focus management)
4. **Game loop** (update → draw → repeat)
5. **Error-proof rendering** (never let drawing functions crash)

### Standard Game Objects
```javascript
const hero = {
    x: 100, y: 300, size: 50, color: '#3498db',
    velocityY: 0, isJumping: false
};

const gameState = {
    score: 0, gameOver: false, paused: false
};
```

## Workshop Facilitation

### Setup Automation
Run platform-specific setup scripts to create:
- VibeCoding folder structure
- Basic game template
- VS Code/Cursor configuration
- Desktop shortcuts

### Emergency Protocols
1. **30-second rule**: If issue not resolved in 30s, use backup method
2. **Offline backup**: Use `workshop-materials/offline-backup/` templates
3. **No-debugging approach**: Replace error investigation with template reset
4. **Positive framing**: "Error는 배우는 기회야!" (Errors are learning opportunities!)

### Success Metrics
- **Completion rate**: 80%+ finish basic game
- **Feature implementation**: 70%+ add movement, 50%+ add additional features  
- **Engagement**: All children participate in final presentation
- **Satisfaction**: "다시 하고 싶어요!" (Want to do again!)

## Common Issues & Solutions

### "화면이 안 나와요" (Screen not showing)
1. Check file saved (Ctrl+S)
2. Refresh browser (F5)
3. Restart Live Server
4. **Backup**: Open HTML file directly in browser

### "키보드가 안 먹어요" (Keyboard not working)  
1. Click on game canvas to focus
2. Check case sensitivity in key names
3. **Backup**: Switch to mouse-click controls

### "에러가 났어요" (Error occurred)
1. **Never debug with children**
2. Use positive language: "좋은 발견이야!"
3. Reset to last working state (Ctrl+Z)
4. **Backup**: Load fresh template

## File Naming Conventions
- Game files: `game-[feature].html` (e.g., `game-basic.html`)
- Templates: `sandbox-[complexity].html`
- Cursor rules: `cursor-rules.md` (one per workflow)
- Setup scripts: `setup-[platform].[ext]`

## Workshop Game: "바나나 히어로의 모험"
Standard test game featuring:
- Flying monkey hero (keyboard movement)
- Banana throwing mechanics (Z key)
- Enemy characters that slip on bananas
- Score system
- Simple physics (jumping, gravity)

This serves as the consistent baseline for testing all workflow approaches.

## Key Files to Understand

- `sandbox-environments/no-debug-approach.md` - Core philosophy and implementation
- `workshop-materials/facilitator-checklist.md` - Complete workshop timeline  
- `workshop-materials/emergency-troubleshooting.md` - 30-second problem resolution
- `workshop-materials/mcp-automation-guide.md` - MCP Playwright automation and browser testing
- `workflows/` - 5 different teaching approaches to test
# クラス設計

この資料は設計段階のものです。

実装を進めながら内容を変更・追加する可能性があります。

---

# クラス一覧

| クラス名 | 主な役割 | 主担当 |
|----------|----------|--------|
| GameManager | ゲーム全体の進行・画面遷移 | 未定 |
| Trash | ゴミの情報・表示・移動 | 未定 |
| Box | ゴミ箱の管理・判定 | 未定 |
| ScoreManager | スコア管理 | 未定 |
| Timer | 制限時間管理 | 未定 |
| Button | ボタン管理 | 未定 |

---

# クラスの関係

```text
              GameManager
      ┌──────┼────────┐
      │      │        │
      ▼      ▼        ▼
   Timer   Score   Button
      │
      ▼
    Trash
      │
      ▼
     Box
```

GameManager がゲーム全体を管理し、各クラスを利用してゲームを進行する。

---

# GameManager

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| scene | int | 現在の画面 |
| trash | Trash | 現在表示しているゴミ |
| scoreManager | ScoreManager | スコア管理 |
| timer | Timer | 制限時間 |
| boxes | Box[] | ゴミ箱一覧 |

### メソッド

| メソッド | 説明 |
|-----------|------|
| setup() | 初期化 |
| update() | ゲーム更新 |
| draw() | 描画 |
| changeScene() | 画面切替 |
| checkGameEnd() | ゲーム終了判定 |

---

# Trash

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| name | String | ゴミの名前 |
| category | String | ゴミの種類 |
| x | float | X座標 |
| y | float | Y座標 |
| image | PImage | ゴミ画像 |

### メソッド

| メソッド | 説明 |
|-----------|------|
| display() | ゴミを表示 |
| move() | ゴミを移動 |
| reset() | 新しいゴミへ変更 |

---

# Box

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| type | String | ゴミ箱の種類 |
| x | float | X座標 |
| y | float | Y座標 |
| width | int | 横幅 |
| height | int | 高さ |

### メソッド

| メソッド | 説明 |
|-----------|------|
| display() | ゴミ箱表示 |
| checkHit() | ゴミが入ったか判定 |

---

# ScoreManager

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| score | int | 現在の得点 |
| combo | int | 連続正解数 |

### メソッド

| メソッド | 説明 |
|-----------|------|
| addScore() | 得点加算 |
| subtractScore() | 得点減算 |
| reset() | 得点初期化 |

---

# Timer

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| limit | int | 制限時間 |
| startTime | int | 開始時間 |

### メソッド

| メソッド | 説明 |
|-----------|------|
| start() | タイマー開始 |
| update() | 残り時間更新 |
| isFinished() | 時間切れ判定 |

---

# Button

## 主担当

ー

### 属性

| 名前 | 型 | 説明 |
|------|----|------|
| label | String | ボタン名 |
| x | float | X座標 |
| y | float | Y座標 |
| width | int | 横幅 |
| height | int | 高さ |

### メソッド

| メソッド | 説明 |
|-----------|------|
| display() | ボタン表示 |
| isClicked() | クリック判定 |

---

# 今後追加する可能性があるクラス

- SoundManager（効果音・BGM）
- Effect（アニメーション）
- Ranking（ランキング）
- ComboManager（コンボ管理）

※追加機能を実装する場合に作成予定。
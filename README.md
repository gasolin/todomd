README.md
# todomd: A Personal Task Management Specification Compatible with Markdown and todo.txt

`todomd` is a personal task management specification designed to combine the **flexibility of Markdown** with the **conciseness and power of todo.txt**. It leverages [GitHub Flavored Markdown](https://github.github.com/gfm/) (GFM) task lists and hierarchical structures, while integrating core metadata from [todo.txt](https://github.com/todotxt/todo.txt), aiming to deliver a solution that is both human-readable and easy for machines—especially large language models (LLMs)—to parse and process.

We believe that a plain-text, well-structured task list maximizes workflow freedom and seamlessly integrates with various tools and automation workflows.

[中文版本 / Chinese Version](#todomd-兼容-markdown-與-todotxt-的個人任務管理規範)

---

## Why Choose todomd?

* **Native Markdown Support:** You can create, edit, and view `todomd` files using any Markdown editor, enjoying Markdown’s high readability and editing convenience.
* **Preserves Core todo.txt Features:** Key metadata such as priority, projects, contexts, and dates are expressed using `todo.txt`-compatible syntax.
* **Built-in Subtask Support:** Leveraging Markdown’s indentation, `todomd` natively supports hierarchical task structures, making it easy to manage complex projects.
* **LLM-Friendly Parsing:** Structured and clearly defined syntax makes `todomd` files ideal for accurate parsing and understanding by large language models (LLMs), enabling intelligent suggestions and automation.
* **Version Control Friendly:** The plain-text format works perfectly with version control systems like Git for tracking, collaboration, and history management.
* **Highly Extensible:** Using `key:value` format for metadata, you can easily extend task attributes to meet personalized needs.

---

## Getting Started

Refer to [spec.md](spec.md) for detailed syntax specifications of `todomd`.

## Tools

*   **[todomd-cli](https://github.com/gasolin/todomd-cli)**: A powerful, interactive command-line tool for managing your `todomd` files.
*   **[migrate_todotxt.sh](https://github.com/gasolin/todomd/blob/main/todotxt/migrate_todotxt.sh)**: A shell script to help you migrate your existing `todo.txt` files to the `todomd` format.

---

## Contribute

`todomd` is an open specification, and we welcome community feedback and contributions. If you have suggestions, questions, or spot areas for improvement, please open an issue in [Issues](https://github.com/gasolin/todomd/issues).

---

## Example

```markdown
# Today's Tasks

## Project: Website Redesign +WebRedesign

- [ ] (A) Design homepage layout @design due:2025-08-05
  - [ ] Collect user feedback
  - [ ] Competitor analysis
- [ ] (B) Draft copywriting @writing rec:w
  - [ ] Write product description
  - [ ] Write service explanation

## Personal To-Dos

- [ ] Reply to emails @email
- [x] Pay utility bills cm:2025-08-01
- [ ] Grocery shopping cr:2025-08-02
  - [ ] Beef
  - [ ] Vegetables
  - [ ] Eggs /no_think
```

---

# todomd: 兼容 Markdown 與 todo.txt 的個人任務管理規範

`todomd` 是一個旨在結合 **Markdown 的靈活性**與 **todo.txt 的簡潔強大**的個人任務管理規範。它利用 [GitHub Flavored Markdown](https://github.github.com/gfm/) (GFM) 的任務列表和層次結構，同時整合 [todo.txt](https://github.com/todotxt/todo.txt) 的核心元數據，旨在提供一個既能方便人類閱讀和編輯，又易於機器（尤其是大型語言模型 LLM）解析和處理的任務管理方案。

我們相信，一個基於純文字且結構清晰的任務列表，能最大化您的工作流程自由度，並與各種工具和自動化流程無縫整合。

---

## 為什麼選擇 todomd？

* **Markdown 原生支持：** 您可以使用任何 Markdown 編輯器來創建、編輯和查看 `todomd` 文件，享受 Markdown 帶來的高度可讀性和編輯便利性。
* **兼顧 todo.txt 核心功能：** 重要的元數據如優先級、專案、情境和日期，都以 `todo.txt` 兼容的語法表示。
* **內建子任務支持：** 利用 Markdown 的縮排特性，`todomd` 原生支持任務的層次結構，讓您輕鬆管理複雜專案。
* **利於 LLM 解析：** 結構化且具備明確語法的 `todomd` 文件，極易被大型語言模型 (LLM) 準確解析、理解，並用於提供智慧化建議和自動化。
* **版本控制友好：** 純文字格式非常適合使用 Git 等版本控制系統進行追蹤、協作和歷史管理。
* **高度可擴展性：** 透過 `key:value` 格式的元數據，您可以輕鬆擴展任務屬性，以滿足個人化需求。

---

## 開始使用

查看 [spec.md](spec.md) 了解 `todomd` 的詳細語法規範。

## 工具

*   **[todomd-cli](https://github.com/gasolin/todomd-cli)**: 一個功能強大、互動式的命令列工具，用於管理您的 `todomd` 檔案。
*   **[migrate_todotxt.sh](https://github.com/gasolin/todomd/blob/main/todotxt/migrate_todotxt.sh)**: 一個 shell 腳本，幫助您將現有的 `todo.txt` 檔案遷移到 `todomd` 格式。

---

## 貢獻

`todomd` 是一個開放的規範，我們歡迎社群的意見和貢獻。如果您有任何建議、問題或發現需要改進的地方，請隨時在 [Issues](https://github.com/gasolin/todomd/issues) 中提出。

---

## 範例

```markdown
# 今日任務

## 專案: 網站改版 +WebRedesign

- [ ] (A) 設計首頁佈局 @design due:2025-08-05
  - [ ] 收集用戶回饋
  - [ ] 競品分析
- [ ] (B) 編寫文案初稿 @writing rec:w
  - [ ] 撰寫產品介紹
  - [ ] 撰寫服務說明

## 個人待辦事項

- [ ] 回覆郵件 @email
- [x] 繳納水電費 cm:2025-08-01
- [ ] 採買食材 cr:2025-08-02
  - [ ] 牛肉
  - [ ] 蔬菜
  - [ ] 雞蛋
```

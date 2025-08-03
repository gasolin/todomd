# todomd Specification: Syntax and Structure

`todomd` is designed to provide an efficient, human- and machine-readable approach to personal task management. It combines the readability of Markdown with structured metadata, building upon GitHub Flavored Markdown (GFM) task list syntax.

[中文版本 / Chinese Version]()

---

## 1. File Naming and Organization

* **Main Task File:** Use `todo.md` as the primary active task list file.
* **Completed or Archived Tasks:**
    * Use `done.md` or `archive.md` to store completed or archived tasks.
    * **Alternatively**, you can use a specific Markdown heading (e.g., `## Completed`) within `todo.md` to logically separate completed items.
* **Project-Based Organization:** Task files can be placed in dedicated folders to represent different projects.

---

## 2. Task Item Syntax

All tasks follow standard Markdown list items, leveraging GFM's task list syntax to indicate their status:

* **Incomplete Task:**
    ```markdown
    - [ ] Task description
    ```
* **Completed Task:**
    ```markdown
    - [x] Task description
    ```
* **Cancelled/Rejected Task (Optional):**
    ```markdown
    - [-] Task description
    ```
    *(This syntax is not part of the GFM standard but can be recognized by tools to represent inactive or cancelled tasks.)*

---

## 3. Core Metadata

`todomd` allows rich metadata to be added within the task description, typically positioned at the **end** of the line using `key:value` format or specific symbols. This preserves readability while enabling machine parsing.

* **Priority (Priority): `(A)` to `(Z)`**
    * **Syntax:** `(uppercase letter)`
    * **Example:** `- [ ] Call client (A)`
    * **Explanation:** `(A)` denotes highest priority, decreasing alphabetically.

* **Projects (Projects): `+project-name`**
    * **Syntax:** `+` followed by a **single-word** project name.
    * **Example:** `- [ ] Complete annual report +financial-review`
    * **Explanation:** A task may belong to multiple projects.

* **Contexts (Contexts): `@context-name`**
    * **Syntax:** `@` followed by a **single-word** context name.
    * **Example:** `- [ ] Reply to email @office`
    * **Explanation:** Indicates where or under what circumstances the task should be completed.

* **Creation Date (Creation Date): `cr:YYYY-MM-DD`**
    * **Syntax:** `cr:` followed by a `YYYY-MM-DD` formatted date.
    * **Example:** `- [ ] Buy new laptop cr:2025-07-28`

* **Completion Date (Completion Date): `cm:YYYY-MM-DD`**
    * **Syntax:** `cm:` followed by a `YYYY-MM-DD` formatted date.
    * **Explanation:** **Only for completed tasks.**
    * **Example:** `- [x] Submit project plan cm:2025-07-30`

* **Due Date (Due Date): `due:YYYY-MM-DD`**
    * **Syntax:** `due:` followed by a `YYYY-MM-DD` formatted date.
    * **Example:** `- [ ] Schedule doctor’s appointment due:2025-08-15`

* **Recurrence (Recurrence): `rec:frequency`**
    * **Syntax:** `rec:` followed by a frequency code (e.g., `d` daily, `w` weekly, `m` monthly, `y` yearly, or `2w` every two weeks).
    * **Example:** `- [ ] Clean kitchen rec:w`

* **Other Custom Attributes: `key:value` or `#tag`**
    * **Syntax:** You can define any custom `key:value` pairs, or use `#` for hashtags.
    * **Example:** `- [ ] Read new book #personal-growth Estimated time:3h`
    * **Explanation:** Offers maximum flexibility for adding any additional information you need.

---

## 4. Subtasks (Hierarchical Structure)

`todomd` natively supports hierarchical task structures, enabling large tasks to be broken down into smaller steps.

* **Indentation Rules:** Subtasks should be **indented below** their parent task. Use **2 or 4 spaces** (or one Tab) consistently. Always maintain consistent indentation.
* **Example:**
    ```markdown
    - [ ] Organize annual event
      - [ ] Confirm date and venue due:2025-09-01
        - [ ] Contact venue rental
        - [ ] Coordinate guest availability
      - [ ] Develop budget
      - [ ] Plan promotion
    ```
* **LLM Parsing Consideration:** Large Language Models (LLMs) can infer hierarchy by analyzing indentation levels. Deeper indentation indicates a subtask.

---

## 5. Sectioning and Organization

Use Markdown headings to divide tasks into logical sections, enhancing file readability and management efficiency.

* **Heading Levels:** Use `#`, `##`, `###`, etc., to create main sections and sub-sections.
* **Example:**
    ```markdown
    # Today's Priorities

    ## School Tasks

    - [ ] Complete math homework
    - [ ] Memorize English vocabulary

    ## Personal To-dos

    - [ ] Buy lunch

    ### Completed Tasks

    - [x] Tidy desk cm:2025-07-29
    ```
* **LLM Parsing Consideration:** Headings serve as additional **contextual cues**, helping LLMs understand task categorization and importance.

---

## 6. Comments

Any line that does not start with a task list symbol (`- [ ]`) or a Markdown heading symbol (`#`) can be interpreted as a regular comment or descriptive text within the file.

* **Example:**
    ```markdown
    # My Task List

    This is a brief introduction explaining the purpose of this file.

    - [ ] Task one

    > This is an additional note, which can use Markdown blockquotes.
    ```

---

## 7. Design Principles and Future Considerations

### 7.1 Design Philosophy

The core philosophy behind `todomd` is balance:
* **Human-Centric:** Uses familiar Markdown syntax to reduce the learning curve.
* **Machine-Readable:** Consistent metadata format and structured layout enable reliable parsing by scripts and Large Language Models (LLMs).
* **Extensible Future:** The `key:value` format provides endless room for future customization without breaking backward compatibility.

### 7.2 Collaboration with LLMs

`todomd` is designed to serve as the **core data source** for LLM-driven task management:
* **Data Extraction:** LLMs can be precisely prompted to extract all task details — status, priority, dates, projects, contexts, and critically, **hierarchical relationships**.
* **Insights and Recommendations:** By analyzing structured data in `todomd`, LLMs can:
    * Identify overdue tasks.
    * Offer daily action recommendations based on priority and due dates.
    * Track project progress.
    * Suggest relevant tasks or resources based on context and past behavior.
    * Automatically generate subtasks or decompose large tasks.
* **Automation Integration:** LLMs can consume `todomd` data and integrate with calendars, email, or note-taking apps to:
    * Send automated reminders.
    * Generate status reports.
    * Update task states in real time.

### 7.3 Future Directions

* **Community Standardization:** Encourage community discussion and refinement of the standard to foster broader adoption.
* **Tool Ecosystem Development:** Promote the creation of tools around `todomd`, including editor plugins, task parsers, and applications for LLM integration.

`todomd` is more than just a task format — it’s a bridge connecting human intuition with machine intelligence, unlocking new possibilities for personal productivity.

---

# todomd 規範：語法與結構

`todomd` 規範旨在提供一個高效且易於解析的個人任務管理解決方案，它結合了 Markdown 的可讀性與結構化元數據。本規範基於 [GitHub Flavored Markdown](https://github.github.com/gfm/) (GFM) 的任務列表語法。

---

## 1. 檔案命名與組織

* **主任務檔案：** 建議使用 `todo.md` 作為主要活躍任務清單檔案。
* **完成或歸檔：**
    * `done.md` 或 `archive.md`：用於存放已完成或已歸檔的任務。
    * **或者**，您也可以在 `todo.md` 檔案內部使用特定的 Markdown 標題（例如 `## 已完成`）來區分已完成的任務。
* **專案級組織：** 任務文件可以放在專屬的資料夾中，以表示不同的專案。

---

## 2. 任務項目語法

所有任務都是標準的 Markdown 列表項目，並利用 GFM 的任務列表語法來表示其狀態：

* **未完成任務：**
    ```markdown
    - [ ] 任務描述
    ```
* **已完成任務：**
    ```markdown
    - [x] 任務描述
    ```
* **取消/拒絕任務 (可選)：**
    ```markdown
    - [-] 任務描述
    ```
    （此語法可被工具識別為非活躍或已取消的任務，但它**不是** GFM 標準的一部分。）

---

## 3. 核心元數據

`todomd` 允許您在任務描述中加入豐富的元數據，這些元數據通常放在任務內容的**末尾**，以 `key:value` 形式或特定的符號表示。這樣既能保持任務的可讀性，又方便機器解析。

* **優先級 (Priority)：`(A)` 到 `(Z)`**
    * **語法：** `(大寫字母)`。
    * **範例：** `- [ ] 打電話給客戶 (A)`
    * **說明：** `(A)` 表示最高優先級，依字母順序遞減。

* **專案 (Projects)：`+專案名稱`**
    * **語法：** `+` 後接**單詞**形式的專案名稱。
    * **範例：** `- [ ] 完成年度報告 +財務審核`
    * **說明：** 任務可能屬於多個專案。

* **情境 (Contexts)：`@情境名稱`**
    * **語法：** `@` 後接**單詞**形式的情境名稱。
    * **範例：** `- [ ] 回覆電子郵件 @辦公室`
    * **說明：** 指示任務可能需要在哪裡或在何種狀態下完成。

* **創建日期 (Creation Date)：`cr:YYYY-MM-DD`**
    * **語法：** `cr:` 後接 `年-月-日` 格式的日期。
    * **範例：** `- [ ] 購買新筆電 cr:2025-07-28`

* **完成日期 (Completion Date)：`cm:YYYY-MM-DD`**
    * **語法：** `cm:` 後接 `年-月-日` 格式的日期。
    * **說明：** **僅用於已完成任務**。
    * **範例：** `- [x] 提交專案計畫 cm:2025-07-30`

* **到期日 (Due Date)：`due:YYYY-MM-DD`**
    * **語法：** `due:` 後接 `年-月-日` 格式的日期。
    * **範例：** `- [ ] 安排醫生預約 due:2025-08-15`

* **重複頻率 (Recurrence)：`rec:頻率`**
    * **語法：** `rec:` 後接頻率代碼（例如 `d` 每日, `w` 每週, `m` 每月, `y` 每年，或 `2w` 每兩週）。
    * **範例：** `- [ ] 清理廚房 rec:w`

* **其他擴展屬性：`key:value` 或 `#標籤`**
    * **語法：** 您可以創建任何自定義的 `key:value` 對，或使用 `#` 符號標籤。
    * **範例：** `- [ ] 閱讀新書 #個人成長 預估時間:3h`
    * **說明：** 提供極大的靈活性，用於添加任何您需要的額外資訊。

---

## 4. 子任務 (層次結構)

`todomd` 原生支持任務的層次結構，讓您可以將大任務拆解為小步驟。

* **縮排規則：** 子任務應在其父任務下方**縮排**。建議使用 **2 個或 4 個空格**（或一個 Tab）進行縮排。請務必保持縮排一致性。
* **範例：**
    ```markdown
    - [ ] 籌備年會
      - [ ] 確定日期和地點 due:2025-09-01
        - [ ] 聯絡場地租賃
        - [ ] 協調嘉賓時間
      - [ ] 制定預算
      - [ ] 宣傳規劃
    ```
* **LLM 解析考量：** 大型語言模型 (LLM) 可以透過分析行首的縮排來識別任務的層次關係。更深的縮排表示子任務。

---

## 5. 分區與組織

使用 Markdown 標題來將任務劃分為不同的邏輯區塊，提高文件的可讀性和管理效率。

* **標題級別：** 使用 `#`、`##`、`###` 等標題來創建主要分區和子分區。
* **範例：**
    ```markdown
    # 今日重點

    ## 學校任務

    - [ ] 完成數學作業
    - [ ] 背英文單字

    ## 個人待辦

    - [ ] 購買午餐

    ### 已完成任務

    - [x] 整理書桌 cm:2025-07-29
    ```
* **LLM 解析考量：** 標題可作為任務的額外**上下文**信息，幫助 LLM 理解任務的歸屬和重要性。

---

## 6. 註釋

* 任何不以任務列表符號 (`- [ ]`) 或 Markdown 標題符號 (`#`) 開頭的行，都可以被視為文件內的普通註釋或描述性文字。
* **範例：**
    ```markdown
    # 我的任務列表

    這是一個簡短的介紹，說明本文件的目的。

    - [ ] 任務一

    > 這是一個額外的說明，可以使用 Markdown 引用區塊。
    ```

---

## 7. 基本原理與未來考量

### 7.1 設計哲學

`todomd` 的設計核心是簡潔與功能性的平衡：
* **人類友好：** 使用人們熟悉的 Markdown 語法，降低學習曲線。
* **機器友好：** 統一的元數據格式和結構化佈局，便於腳本和大型語言模型 (LLM) 進行自動化解析和處理。
* **未來擴展性：** `key:value` 語法為未來添加更多自定義屬性提供了無限可能，且不破壞現有兼容性。

### 7.2 與 LLM 的協同作業

`todomd` 旨在成為 LLM 驅動任務管理的核心數據源：
* **數據提取：** LLM 可以被精確地提示 (prompt) 以提取每個任務的所有詳細信息，包括其狀態、優先級、日期、專案、情境以及最重要的**層次關係**。
* **洞察與建議：** 透過分析 `todomd` 文件中的結構化數據，LLM 可以：
    * 識別過期任務。
    * 基於優先級和到期日提供每日最佳行動建議。
    * 分析專案進度。
    * 基於上下文和過去行為推薦相關任務或資源。
    * 自動生成子任務或分解大型任務。
* **自動化流程：** LLM 可以接收 `todomd` 數據，並與日曆、郵件等其他工具整合，實現自動提醒、報告生成或任務狀態更新。

### 7.3 未來發展方向

* **社群標準化：** 鼓勵社群討論和完善此規範，使其成為更廣泛接受的 Markdown 任務管理標準。
* **工具生態系統：** 促進圍繞 `todomd` 規範的工具開發，包括編輯器插件、任務解析器、以及與 LLM 集成的應用。

`todomd` 不僅是一個任務列表格式，更是一個連接人類直觀操作與機器智能的橋樑，為個人生產力帶來新的可能性。

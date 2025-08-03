# Compatibility and Considerations for Migrating from todo.txt to todomd

`todomd` aims to provide a Markdown-based task management experience compatible with the core concepts of `todo.txt`. For existing `todo.txt` users, migration is feasible, but some syntactic conversions should be carefully considered.

[中文版本 / Chinese Version]()

---

## 1. Compatibility of Core Metadata

`todomd` inherits key metadata symbols from `todo.txt`, though their placement and handling have been adjusted:

* **Priority `(A)`**: In `todo.txt`, priority typically appears at the beginning of a task. In `todomd`, priority is placed immediately after the checkbox.
    * **todo.txt:** `(A) Call Mom`
    * **todomd:** `- [ ] (A) Call Mom`
* **Project `+Project` and Context `@Context`**: These symbols remain unchanged in `todomd` and can be used anywhere within the task description.
    * **todo.txt:** `Call Mom +Family @phone`
    * **todomd:** `- [ ] Call Mom +Family @phone`
* **Dates**: `todo.txt` has specific positions for creation and completion dates. In `todomd`, all dates are unified using `key:value` format (`cr:`, `cm:`, `due:`), and it's recommended to place them at the end of the task line.
    * **todo.txt:**
        * `2025-01-15 Buy groceries` (creation date)
        * `x 2025-07-20 2025-07-15 Finish report` (completion status and date)
        * `Buy milk due:2025-08-01` (custom attribute)
    * **todomd:**
        * `- [ ] Buy groceries cr:2025-01-15`
        * `- [x] Finish report cm:2025-07-20 cr:2025-07-15`
        * `- [ ] Buy milk due:2025-08-01`

---

## 2. Completion Status Conversion

This is the most significant syntactic difference between `todo.txt` and `todomd`:

* **`todo.txt`**: Uses `x` at the start of a line to mark completion.
* **`todomd`**: Uses GFM task list syntax `- [x]` to indicate completion.

**Migration Considerations:**
* A script or tool is needed to convert `x` into `- [x]`, and to reposition and reformat creation and completion dates.
* **Example Conversion:**
    * **todo.txt:** `x 2025-07-30 2025-07-28 Submit report +ProjectA`
    * **todomd:** `- [x] Submit report +ProjectA cm:2025-07-30 cr:2025-07-28`

---

## 3. Subtasks and Hierarchical Structure

`todo.txt` does not natively support subtasks. `todomd` leverages Markdown indentation to implement this functionality — a significant enhancement:

* **Migration Considerations:** If your `todo.txt` file uses non-standard methods (e.g., special project names or comments) to represent subtasks, you will need to manually or programmatically convert these relationships into `todomd`’s indented structure. This is typically the most labor-intensive part of the migration process.
* **Advantage:** Once migrated, you gain clearer, more intuitive task hierarchy management.

---

## 4. File Organization and Partitioning

`todo.txt` typically uses a single plain-text file with task sorting being crucial. In contrast, `todomd` uses Markdown headings (`#`, `##`) to logically partition tasks, offering greater flexibility:

* **Migration Considerations:** You can divide tasks from your original `todo.txt` into different sections in the `todomd` file based on project, context, or any other logical grouping.
* **Advantage:** Improved readability and navigation for large task lists.

---

## 5. Data Archiving

* **`todo.txt`**: Often uses a separate `done.txt` file to archive completed tasks.
* **`todomd`**: You can continue using `done.md` for archiving. Alternatively, you may choose to keep completed tasks in a dedicated section of the main `todo.md` file (e.g., `## Completed Tasks`), which might be more convenient for reviewing historical data.

---

## 6. Migration Tools and Scripts

Manually migrating all `todo.txt` tasks into `todomd` can be tedious, especially for large files. We encourage the community to develop or use existing scripts to automate the following conversions:

* Convert `x` status to `- [x]`.
* Re-format and reposition dates (creation, completion).
* Parse and generate hierarchical subtask structures (if non-standard subtask markers exist in `todo.txt`).
* Automatically adjust priorities, projects, and contexts to their recommended positions in `todomd`.

---

## 7. Conclusion

Migrating from `todo.txt` to `todomd` represents an upgrade that preserves the core strength of plain-text task management while introducing Markdown’s powerful readability and structured formatting capabilities—particularly subtask support. Although there are differences in completion status and date formatting, these can be smoothly handled with proper tools. Once migration is complete, `todomd` will offer you a more flexible, powerful, and better-integrated platform for task management—ideal for modern workflows, including integration with LLMs.

----

# 從 todo.txt 遷移至 todomd 的兼容性與考量

`todomd` 旨在提供與 `todo.txt` 核心概念兼容的 Markdown 任務管理體驗。對於現有的 `todo.txt` 用戶，遷移是可行的，但需要注意一些語法上的轉換。

---

## 1. 核心元數據的兼容性

`todomd` 繼承了 `todo.txt` 的關鍵元數據符號，但在位置和處理方式上有所調整：

* **優先級 `(A)`：** 在 `todo.txt` 中通常在任務開頭。在 `todomd` 中，優先級緊跟在任務的 checkbox 後方。
    * **todo.txt:** `(A) Call Mom`
    * **todomd:** `- [ ] (A) Call Mom`
* **專案 `+Project` 與情境 `@Context`：** 這兩個符號在 `todomd` 中保持不變，並且可以在任務描述的任何位置使用。
    * **todo.txt:** `Call Mom +Family @phone`
    * **todomd:** `- [ ] Call Mom +Family @phone`
* **日期：** `todo.txt` 的創建日期和完成日期有特定位置。`todomd` 統一使用 `key:value` 格式 (`cr:`, `cm:`, `due:`)，並建議放在任務行的末尾。
    * **todo.txt:**
        * `2025-01-15 Buy groceries` (創建日期)
        * `x 2025-07-20 2025-07-15 Finish report` (完成狀態與日期)
        * `Buy milk due:2025-08-01` (擴展屬性)
    * **todomd:**
        * `- [ ] Buy groceries cr:2025-01-15`
        * `- [x] Finish report cm:2025-07-20 cr:2025-07-15`
        * `- [ ] Buy milk due:2025-08-01`

---

## 2. 完成狀態的轉換

這是 `todo.txt` 與 `todomd` 最主要的語法差異：

* **`todo.txt`：** 使用行首的 `x` 表示完成。
* **`todomd`：** 使用 GFM 任務列表的 `- [x]` 表示完成。

**遷移考量：**
* 需要腳本或工具來將 `x` 轉換為 `- [x]`，並調整創建/完成日期的位置和格式。
* 範例轉換：
    * **todo.txt:** `x 2025-07-30 2025-07-28 Submit report +ProjectA`
    * **todomd:** `- [x] Submit report +ProjectA cm:2025-07-30 cr:2025-07-28`

---

## 3. 子任務與層次結構

`todo.txt` 本身不支持內建的子任務。`todomd` 利用 Markdown 的縮排來實現這一功能，這是一個重要的增強：

* **遷移考量：** 如果您的 `todo.txt` 文件中有透過非標準方式（例如使用特殊的專案名或註釋）來表示子任務，則在遷移時需要手動或透過複雜的腳本來將這些關係轉換為 `todomd` 的縮排結構。這通常是遷移過程中需要投入較多精力的地方。
* **優勢：** 一旦遷移完成，您將能享受到更清晰、更直觀的任務層次管理。

---

## 4. 文件組織與分區

`todo.txt` 通常是一個單一的純文本文件，任務排序是關鍵。`todomd` 利用 Markdown 標題 (`#`, `##`) 來進行邏輯分區，這提供了更大的彈性：

* **遷移考量：** 您可以將原 `todo.txt` 中的任務根據專案、情境或任何邏輯歸屬，劃分到 `todomd` 文件中的不同標題下。
* **優勢：** 提高大型任務清單的可讀性和導航性。

---

## 5. 數據歸檔

* **`todo.txt`：** 通常使用 `done.txt` 檔案來歸檔已完成的任務。
* **`todomd`：** 可以繼續使用 `done.md` 進行歸檔。或者，您可以選擇將已完成的任務保留在主 `todo.md` 檔案的特定標題下（例如 `## 已完成任務`），這在某些情況下可能更方便查看歷史記錄。

---

## 6. 遷移工具與腳本

手動遷移所有 `todo.txt` 任務到 `todomd` 可能會很繁瑣，特別是對於大型文件。鼓勵社群開發或使用現有腳本來自動化以下轉換：

* **將 `x` 狀態轉換為 `- [x]`。**
* **重新定位和格式化日期（創建、完成）。**
* **解析並創建子任務層次結構（如果 `todo.txt` 中有非標準的子任務表示）。**
* **自動將優先級、專案和情境調整到 `todomd` 建議的位置。**

---

## 7. 總結

從 `todo.txt` 遷移到 `todomd` 是一個升級，它保留了純文本任務管理的核心優勢，同時引入了 Markdown 強大的可讀性和結構化能力，特別是子任務支持。儘管在完成狀態和日期格式上存在一些差異，但這些差異可以透過工具進行相對平滑的轉換。一旦完成遷移，`todomd` 將為您提供一個更靈活、更強大、也更易於與現代工具（如 LLM）集成的任務管理平台。

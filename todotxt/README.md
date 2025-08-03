# Todo.txt to todomd Migration Tool

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Language-Bash-green.svg)](https://www.gnu.org/software/bash/)

A bash script to migrate your [todo.txt](https://github.com/todotxt/todo.txt) format task lists to the modern [todomd](https://github.com/gasolin/todomd) format, combining the simplicity of plain text with the rich structure of Markdown.

## 🚀 Features

- **Complete Format Conversion**: Seamlessly converts todo.txt syntax to todomd format
- **Preserves All Metadata**: Maintains priorities, projects, contexts, and dates
- **Handles Both Active and Completed Tasks**: Processes `todo.txt` and `done.txt` files
- **Safe Migration**: Includes dry-run mode and comprehensive error handling
- **Flexible Output**: Customizable file names and locations
- **Verbose Logging**: Detailed conversion tracking with colored output
- **Zero Dependencies**: Pure bash script - no external tools required

## 📋 Requirements

- Bash 4.0 or higher
- Standard Unix utilities (cat, sed, etc.)

## 🛠️ Installation

### Option 1: Direct Download
```bash
curl -O https://raw.githubusercontent.com/gasolin/todo-migration/main/migrate_todo.sh
chmod +x migrate_todotxt.sh
```

### Option 2: Clone Repository
```bash
git clone https://github.com/your-username/todo-migration.git
cd todo-migration
chmod +x migrate_todotxt.sh
```

## 📖 Usage

### Basic Usage
```bash
./migrate_todotxt.sh -i todo.txt -o todo.md
```

### Complete Migration (with done tasks)
```bash
./migrate_todotxt.sh -i todo.txt -o todo.md -d done.txt -D done.md
```

### Dry Run (preview without writing files)
```bash
./migrate_todotxt.sh -i todo.txt -o todo.md --dry-run --verbose
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `-i, --input FILE` | Specify todo.txt input file |
| `-o, --output FILE` | Specify todomd output file (default: todo.md) |
| `-d, --done-input FILE` | Specify done.txt input file (optional) |
| `-D, --done-output FILE` | Specify completed tasks output file (default: done.md) |
| `-v, --verbose` | Enable verbose output |
| `-n, --dry-run` | Preview conversion without writing files |
| `--no-header` | Don't add file headers |
| `-h, --help` | Show help information |

## 🔄 Conversion Examples

### Before (todo.txt format)
```
(A) Call Mom +Family @phone
x 2025-07-20 2025-07-15 Finish quarterly report +Work
2025-07-28 Buy groceries @errands
Schedule dentist appointment due:2025-08-15 +Health
```

### After (todomd format)
```markdown
# My Task List

- [ ] (A) Call Mom +Family @phone
- [x] Finish quarterly report +Work cm:2025-07-20 cr:2025-07-15
- [ ] Buy groceries @errands cr:2025-07-28
- [ ] Schedule dentist appointment +Health due:2025-08-15
```

## 📊 What Gets Converted

| todo.txt Element | todomd Output | Description |
|------------------|---------------|-------------|
| `(A) Task` | `- [ ] (A) Task` | Priority preserved |
| `x 2025-07-20 Task` | `- [x] Task cm:2025-07-20` | Completed task with completion date |
| `2025-07-15 Task` | `- [ ] Task cr:2025-07-15` | Creation date |
| `+Project` | `+Project` | Project tags preserved |
| `@Context` | `@Context` | Context tags preserved |
| `due:2025-08-01` | `due:2025-08-01` | Due dates preserved |

## 🎯 todomd Format Benefits

- **Markdown Compatibility**: Works with any Markdown editor or viewer
- **Rich Formatting**: Support for subtasks, headers, and structure
- **LLM Integration**: Designed for AI-powered task management
- **Human Readable**: Clean, intuitive syntax
- **Tool Ecosystem**: Growing ecosystem of todomd-compatible tools

## 🔧 Advanced Usage

### Custom File Organization
```bash
# Separate projects into different files
./migrate_todotxt.sh -i work_todo.txt -o projects/work.md
./migrate_todotxt.sh -i personal_todo.txt -o projects/personal.md
```

### Batch Processing
```bash
#!/bin/bash
for file in *.txt; do
    if [[ "$file" == *"todo"* ]]; then
        ./migrate_todotxt.sh -i "$file" -o "${file%.txt}.md" -v
    fi
done
```

## 🐛 Troubleshooting

### Common Issues

**Permission Denied**
```bash
chmod +x migrate_todo.sh
```

**File Not Found**
- Ensure input files exist and paths are correct
- Use absolute paths if working from different directories

**Unexpected Output**
- Use `--dry-run --verbose` to preview conversion
- Check input file format compliance with todo.txt spec

### Getting Help

1. Run `./migrate_todotxt.sh --help` for usage information
2. Use `--verbose` flag for detailed conversion logs
3. Try `--dry-run` to preview changes before applying

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

### Development Setup
```bash
git clone https://github.com/your-username/todo-migration.git
cd todo-migration
```

### Running Tests
```bash
# Test with sample files
./test/run_tests.sh
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [todo.txt](https://github.com/todotxt/todo.txt) community for the original format
- [todomd](https://github.com/todomd/spec) specification authors
- Contributors and testers who helped improve this tool

## 📚 Related Projects

- [todo.txt](https://github.com/todotxt/todo.txt) - The original plain text task management format
- [todomd spec](https://github.com/todomd/spec) - Modern Markdown-based task management
- [todomd tools](https://github.com/todomd) - Ecosystem of todomd-compatible applications

## 🔗 Links

- [todomd Specification](https://todomd.org)
- [todo.txt Format](https://github.com/todotxt/todo.txt)
- [Issue Tracker](https://github.com/your-username/todo-migration/issues)
- [Releases](https://github.com/your-username/todo-migration/releases)

---

**Made with ❤️ for the productivity community**

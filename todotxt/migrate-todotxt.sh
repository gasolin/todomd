#!/bin/bash

# todo.txt to todomd Migration Script
# Version: 1.0
# Purpose: Convert todo.txt format task lists to todomd format

set -e

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
INPUT_FILE=""
OUTPUT_FILE=""
DONE_INPUT=""
DONE_OUTPUT=""
VERBOSE=false
DRY_RUN=false
ADD_HEADER=true

# Help information
show_help() {
    cat << EOF
Todo.txt to todomd Migration Tool

Usage: $0 [options] -i <input_file> -o <output_file>

Options:
    -i, --input FILE        Specify todo.txt input file
    -o, --output FILE       Specify todomd output file (default: todo.md)
    -d, --done-input FILE   Specify done.txt input file (optional)
    -D, --done-output FILE  Specify completed tasks output file (default: done.md)
    -v, --verbose           Verbose output
    -n, --dry-run          Dry run, don't actually write files
    --no-header            Don't add file header
    -h, --help             Show this help information

Examples:
    $0 -i todo.txt -o todo.md
    $0 -i todo.txt -o todo.md -d done.txt -D done.md -v
    $0 --input todo.txt --output todo.md --verbose --dry-run

EOF
}

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_verbose() {
    if [[ "$VERBOSE" == true ]]; then
        echo -e "${BLUE}[VERBOSE]${NC} $1"
    fi
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -i|--input)
                INPUT_FILE="$2"
                shift 2
                ;;
            -o|--output)
                OUTPUT_FILE="$2"
                shift 2
                ;;
            -d|--done-input)
                DONE_INPUT="$2"
                shift 2
                ;;
            -D|--done-output)
                DONE_OUTPUT="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -n|--dry-run)
                DRY_RUN=true
                shift
                ;;
            --no-header)
                ADD_HEADER=false
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

# Validate input
validate_input() {
    if [[ -z "$INPUT_FILE" ]]; then
        log_error "Input file must be specified (-i or --input)"
        exit 1
    fi

    if [[ ! -f "$INPUT_FILE" ]]; then
        log_error "Input file does not exist: $INPUT_FILE"
        exit 1
    fi

    if [[ -z "$OUTPUT_FILE" ]]; then
        OUTPUT_FILE="todo.md"
        log_info "Using default output file: $OUTPUT_FILE"
    fi

    if [[ -n "$DONE_INPUT" && ! -f "$DONE_INPUT" ]]; then
        log_error "Done tasks input file does not exist: $DONE_INPUT"
        exit 1
    fi

    if [[ -z "$DONE_OUTPUT" ]]; then
        DONE_OUTPUT="done.md"
    fi
}

# Convert single task line
convert_task_line() {
    local line="$1"
    local is_completed="$2"
    
    # Remove leading/trailing whitespace
    line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    # Skip empty lines
    if [[ -z "$line" ]]; then
        return
    fi
    
    local result=""
    local priority=""
    local creation_date=""
    local completion_date=""
    local task_text=""
    
    # Process completed task format: x YYYY-MM-DD YYYY-MM-DD task
    if [[ "$is_completed" == true ]]; then
        # Remove leading 'x '
        line=$(echo "$line" | sed 's/^x[[:space:]]\+//')
        
        # Extract completion date (first date)
        if [[ "$line" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})[[:space:]]+(.*) ]]; then
            completion_date="${BASH_REMATCH[1]}"
            line="${BASH_REMATCH[2]}"
            
            # Extract creation date (second date, if exists)
            if [[ "$line" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})[[:space:]]+(.*) ]]; then
                creation_date="${BASH_REMATCH[1]}"
                line="${BASH_REMATCH[2]}"
            fi
        fi
        
        result="- [x]"
    else
        # Process incomplete tasks
        result="- [ ]"
        
        # Extract creation date (date at beginning of line)
        if [[ "$line" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})[[:space:]]+(.*) ]]; then
            creation_date="${BASH_REMATCH[1]}"
            line="${BASH_REMATCH[2]}"
        fi
    fi
    
    # Extract priority (A) to (Z)
    if [[ "$line" =~ ^\(([A-Z])\)[[:space:]]+(.*) ]]; then
        priority="(${BASH_REMATCH[1]})"
        line="${BASH_REMATCH[2]}"
    fi
    
    # Build task text
    task_text="$line"
    
    # Combine result
    if [[ -n "$priority" ]]; then
        result="$result $priority $task_text"
    else
        result="$result $task_text"
    fi
    
    # Add date information to end of line
    if [[ -n "$completion_date" ]]; then
        result="$result cm:$completion_date"
    fi
    if [[ -n "$creation_date" ]]; then
        result="$result cr:$creation_date"
    fi
    
    echo "$result"
}

# Process file conversion
convert_file() {
    local input_file="$1"
    local output_file="$2"
    local is_done_file="$3"
    local title="$4"
    
    log_info "Converting $input_file -> $output_file"
    
    local temp_file=""
    if [[ "$DRY_RUN" == false ]]; then
        temp_file=$(mktemp)
    fi
    
    local line_count=0
    local converted_count=0
    
    # Add file header
    if [[ "$ADD_HEADER" == true && -n "$title" ]]; then
        if [[ "$DRY_RUN" == true ]]; then
            echo "# $title"
            echo ""
        else
            echo "# $title" > "$temp_file"
            echo "" >> "$temp_file"
        fi
    fi
    
    # Read and convert each line
    while IFS= read -r line || [[ -n "$line" ]]; do
        ((line_count++))
        
        # Skip comment lines and empty lines
        if [[ "$line" =~ ^[[:space:]]*$ ]] || [[ "$line" =~ ^[[:space:]]*# ]]; then
            continue
        fi
        
        local converted_line
        if [[ "$is_done_file" == true ]]; then
            converted_line=$(convert_task_line "$line" true)
        else
            # Check if it's a completed task
            if [[ "$line" =~ ^x[[:space:]] ]]; then
                converted_line=$(convert_task_line "$line" true)
            else
                converted_line=$(convert_task_line "$line" false)
            fi
        fi
        
        if [[ -n "$converted_line" ]]; then
            ((converted_count++))
            if [[ "$DRY_RUN" == true ]]; then
                echo "$converted_line"
            else
                echo "$converted_line" >> "$temp_file"
            fi
            log_verbose "Converted: $line -> $converted_line"
        fi
    done < "$input_file"
    
    if [[ "$DRY_RUN" == false ]]; then
        mv "$temp_file" "$output_file"
        log_success "Created $output_file"
    else
        log_info "[Dry run] Would create $output_file"
    fi
    
    log_info "Processed $line_count lines, converted $converted_count tasks"
}

# Main function
main() {
    log_info "Todo.txt to todomd Migration Tool started"
    
    parse_args "$@"
    validate_input
    
    if [[ "$DRY_RUN" == true ]]; then
        log_warning "Dry run mode - will not actually write files"
    fi
    
    # Convert main task file
    convert_file "$INPUT_FILE" "$OUTPUT_FILE" false "My Task List"
    
    # Convert completed tasks file (if provided)
    if [[ -n "$DONE_INPUT" ]]; then
        convert_file "$DONE_INPUT" "$DONE_OUTPUT" true "Completed Tasks"
    fi
    
    echo ""
    log_success "Migration completed!"
    
    if [[ "$DRY_RUN" == false ]]; then
        echo ""
        log_info "Generated files:"
        echo "  - Main task file: $OUTPUT_FILE"
        if [[ -n "$DONE_INPUT" ]]; then
            echo "  - Completed tasks: $DONE_OUTPUT"
        fi
        echo ""
        log_info "Please review the conversion results and manually adjust subtask hierarchies as needed"
        log_info "You can use a Markdown editor to open the generated files for further editing"
    fi
}

# Error handling
trap 'log_error "An error occurred during script execution, line: $LINENO"' ERR

# Execute main function
main "$@"

#!/bin/bash

# Allowed file extensions
ALLOWED_EXTENSIONS=("sh" "java" "bash" "cpp" "js" "jsx" "css" "csx" "ts" "go" "rb" "yml" "yaml" "tf" "py" "md")
# Directories to exclude
EXCLUDED_DIRS=("node_modules" ".git" "__pycache__" "dist" "build" "venv")

# Function to check if a file has a valid extension
is_valid_file() {
  local filename="$1"
  for ext in "${ALLOWED_EXTENSIONS[@]}"; do
    if [[ "$filename" == *.$ext ]]; then
      return 0
    fi
  done
  return 1
}

# Function to build tree structure
build_tree_structure() {
  local root_dir="$1"
  local max_depth="$2"
  local current_depth=0

  find "$root_dir" -mindepth 1 -maxdepth "$max_depth" -type d \( -name "${EXCLUDED_DIRS[0]}" $(printf " -o -name %s" "${EXCLUDED_DIRS[@]:1}") \) -prune -o -print | while read -r path; do
    depth=$(echo "$path" | awk -F/ '{print NF-1}')
    indent=$(printf "%*s" $((depth * 2)) "")
    echo "${indent}${path#$root_dir/}"
  done
}

# Function to extract files
extract_files() {
  local root_dir="$1"
  local max_depth="$2"
  local output_file="$3"
  local timestamp
  timestamp=$(date +"%Y%m%d-%H%M%S")
  [ -z "$output_file" ] && output_file="extracted-$timestamp.txt"

  local collected_files=()
  local readme_content=""
  local requirements_content=""

  while IFS= read -r -d '' file; do
    if is_valid_file "$file"; then
      collected_files+=("$file")
    elif [[ "$(basename "$file")" == "README.md" ]]; then
      readme_content=$(< "$file")
    elif [[ "$(basename "$file")" == "requirements.txt" ]]; then
      requirements_content=$(< "$file")
    fi
  done < <(find "$root_dir" -mindepth 1 -maxdepth "$max_depth" -type f -print0)

  {
    echo "Directory Tree Structure:"
    build_tree_structure "$root_dir" "$max_depth"
    echo -e "\nCollected Files Content:"
    for file_path in "${collected_files[@]}"; do
      if [[ -f "$file_path" ]]; then
        echo "File: $file_path"
        cat "$file_path"
        echo -e "\n################################################################################\n"
      else
        echo "Warning: File $file_path not found, skipping."
      fi
    done
    if [ -n "$readme_content" ]; then
      echo -e "\nREADME Content:\n$readme_content"
      echo -e "\n################################################################################\n"
    fi
    if [ -n "$requirements_content" ]; then
      echo -e "\nRequirements.txt Content:\n$requirements_content"
      echo -e "\n################################################################################\n"
    fi
  } > "$output_file"

  if [ -n "$requirements_content" ]; then
    analyze_requirements "$root_dir" "$requirements_content" "$output_file"
  fi

  echo "Extraction and analysis completed. Check the output file: $output_file"
}

# Function to analyze requirements
analyze_requirements() {
  local root_dir="$1"
  local requirements_content="$2"
  local output_file="$3"
  local matches=()

  IFS=$'\n' read -d '' -r -a requirements <<< "$requirements_content"

  for req in "${requirements[@]}"; do
    req_matches=()
    while IFS= read -r -d '' file; do
      if grep -q "$req" "$file"; then
        req_matches+=("$file")
      fi
    done < <(find "$root_dir" -mindepth 1 -maxdepth 4 -type f -print0)

    matches+=("$req: ${req_matches[*]}")
  done

  {
    echo -e "\nRequirements Analysis:"
    for match in "${matches[@]}"; do
      echo "$match"
      match_percentage=$(awk -v matched="${#req_matches[@]}" -v total="${#requirements[@]}" 'BEGIN { printf "%.2f", (matched / total) * 100 }')
      echo "Match Percentage: $match_percentage%"
      echo "################################################################################"
    done
  } >> "$output_file"
}

# Main script
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <root_dir> [--output <output_file>]"
  exit 1
fi

root_dir="$1"
output_file=""

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --output)
      shift
      output_file="$1"
      ;;
    *)
      root_dir="$1"
      ;;
  esac
  shift
done

if [ ! -d "$root_dir" ]; then
  echo "Error: $root_dir is not a valid directory."
  exit 1
fi

extract_files "$root_dir" 4 "$output_file"


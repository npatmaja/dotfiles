#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract basic info
pwd=$(echo "$input" | jq -r '.workspace.current_dir')
model_name=$(echo "$input" | jq -r '.model.display_name')

# Get git branch
git_branch=$(cd "$pwd" 2>/dev/null && git --no-optional-locks branch --show-current 2>/dev/null)
if [ -n "$git_branch" ]; then
  git_info=" $git_branch"
else
  git_info=""
fi

# Calculate context window usage
usage=$(echo "$input" | jq '.context_window.current_usage')
if [ "$usage" != "null" ]; then
  # Current context tokens (not cumulative)
  input_tokens=$(echo "$usage" | jq '.input_tokens')
  cache_creation=$(echo "$usage" | jq '.cache_creation_input_tokens')
  cache_read=$(echo "$usage" | jq '.cache_read_input_tokens')
  output_tokens=$(echo "$usage" | jq '.output_tokens')
  
  # Total current context
  current_total=$((input_tokens + cache_creation + cache_read))
  
  # Context window size
  context_size=$(echo "$input" | jq '.context_window.context_window_size')
  
  # Calculate percentage
  if [ "$context_size" -gt 0 ]; then
    context_pct=$((current_total * 100 / context_size))
  else
    context_pct=0
  fi
  
  # Get cumulative totals for the session
  total_input=$(echo "$input" | jq '.context_window.total_input_tokens')
  total_output=$(echo "$input" | jq '.context_window.total_output_tokens')

  context_info=$(printf " | ctx:%d%%" "$context_pct")
  token_info=$(printf " | %dk/%dk" "$((total_input / 1000))" "$((total_output / 1000))")
else
  context_info=""
  token_info=""
fi

# Build status line with vibrant colors
# Format: directory git_branch | model | context% | tokens
# Colors: Magenta (directory), Cyan (git), Yellow (model), Green (context%), Blue (tokens)

# Directory in bright magenta
dir_output=$(printf '\033[95m%s\033[0m' "$(basename "$pwd")")

# Git branch in bright cyan
if [ -n "$git_info" ]; then
  git_output=$(printf '\033[96m%s\033[0m' "$git_info")
else
  git_output=""
fi

# Model name in bright yellow
model_output=$(printf '\033[93m%s\033[0m' "$model_name")

# Context percentage in bright green
if [ -n "$context_info" ]; then
  context_output=$(printf ' | \033[92mctx:%d%%\033[0m' "$context_pct")
else
  context_output=""
fi

# Token usage in bright blue
if [ -n "$token_info" ]; then
  token_output=$(printf ' | \033[94m%dk/%dk\033[0m' "$((total_input / 1000))" "$((total_output / 1000))")
else
  token_output=""
fi

# Combine all elements
printf '%s%s\033[90m | \033[0m%s%s%s' \
  "$dir_output" \
  "$git_output" \
  "$model_output" \
  "$context_output" \
  "$token_output"

#!/bin/bash

# 출력 파일 이름
OUTPUT_FILE="all_dart_files.txt"

# 기존 파일이 있다면 삭제
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

# 모든 .dart 파일 찾기
find . -type f -name "*.dart" | while read -r file; do
    echo "==== $file ====" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo -e "\n\n" >> "$OUTPUT_FILE"
done

echo "✅ 모든 Dart 파일이 $OUTPUT_FILE 에 저장되었습니다!"
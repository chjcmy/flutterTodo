#!/bin/bash

# 출력 파일 이름
OUTPUT_FILE="all_dart_files.txt"

# 기존 파일 삭제
rm -f $OUTPUT_FILE

# Dart 파일을 찾아서 추가
find . -type f -name "*.dart" | while read file; do
    echo "===== $file =====" >> $OUTPUT_FILE
    cat "$file" >> $OUTPUT_FILE
    echo -e "\n\n" >> $OUTPUT_FILE
done

echo "✅ 모든 Dart 파일이 '$OUTPUT_FILE'에 저장되었습니다."
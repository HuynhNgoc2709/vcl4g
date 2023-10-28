#!/bin/bash

# Token GitHub
GITHUB_TOKEN="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"

# Tên chủ sở hữu repository
OWNER="HuynhNgoc2709"

# Tên repository
REPO="CheckUpdateAppMod"

# Tên file cần đọc
FILE="logWeb"

# Đường dẫn URL đến file
URL="https://api.github.com/repos/$OWNER/$REPO/contents/$FILE"

# Lấy nội dung file từ GitHub API
RESPONSE=$(curl -H "Authorization: token $GITHUB_TOKEN" $URL)

# Lấy giá trị mã hóa base64 của nội dung file từ JSON response
CONTENT_BASE64=$(echo "$RESPONSE" | jq -r '.content')

# Giải mã base64 nội dung file
CONTENT=$(echo "$CONTENT_BASE64" | base64 -d)

# Sửa 5 ký tự cuối cùng thành random string 5 ký tự
NEW_CONTENT=$(echo "$CONTENT" | sed "s/.....$/$(openssl rand -hex 5)/")

# In ra nội dung sau khi sửa đổi
echo "$NEW_CONTENT"

# Kết thúc script

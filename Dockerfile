FROM tuthanika/openlist:latest-lite-aria2

# Ghi đè entrypoint.sh bằng bản đã sửa
COPY entrypoint.sh /entrypoint.sh

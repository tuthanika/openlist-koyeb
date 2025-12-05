#!/bin/sh

umask ${UMASK}

# Ensure /opt/openlist/data exists and is writable
if [ ! -d /opt/openlist/data ]; then
  mkdir -p /opt/openlist/data
fi
chmod 777 /opt/openlist/data

if [ "$1" = "version" ]; then
  ./openlist version
else
  # Check file of /opt/openlist/data permissions for current user
  if [ -d ./data ]; then
    if ! [ -w ./data ] || ! [ -x ./data ]; then
  cat <<EOF
Error: Current user does not have write and/or execute permissions for the ./data directory: $(pwd)/data
Please visit https://doc.oplist.org/guide/installation/docker#for-version-after-v4-1-0 for more information.
错误：当前用户没有 ./data 目录（$(pwd)/data）的写和/或执行权限。
请访问 https://doc.oplist.org/guide/installation/docker#v4-1-0-%E4%BB%A5%E5%90%8E%E7%89%88%E6%9C%AC 获取更多信息。
Exiting...
EOF
      exit 1
    fi
  fi

  # Define the target directory path for aria2 service
  ARIA2_DIR="/opt/service/start/aria2"
  if [ "$RUN_ARIA2" = "true" ]; then
    if [ ! -d "$ARIA2_DIR" ]; then
      mkdir -p "$ARIA2_DIR"
      cp -r /opt/service/stop/aria2/* "$ARIA2_DIR" 2>/dev/null
    fi
    runsvdir /opt/service/start &
  else
    if [ -d "$ARIA2_DIR" ]; then
      rm -rf "$ARIA2_DIR"
    fi
  fi
  exec ./openlist server --no-prefix
fi

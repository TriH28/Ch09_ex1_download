#!/bin/sh
set -e

# Render cung cấp biến PORT; nếu chạy local thì dùng 8080
PORT="${PORT:-8080}"

# Đổi cổng Tomcat Connector thành $PORT
sed -ri "s/port=\"8080\"/port=\"${PORT}\"/g" "$CATALINA_HOME/conf/server.xml"

# Chạy Tomcat
exec catalina.sh run

# Tomcat 9 + JDK 17 (Temurin)
FROM tomcat:9.0-jdk17-temurin

# Tùy chọn: giới hạn RAM JVM (chỉnh theo nhu cầu)
ENV CATALINA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC"

# Dọn app mặc định của Tomcat cho nhẹ
RUN rm -rf "$CATALINA_HOME/webapps/*"

# Copy WAR của bạn và đặt làm ROOT context
# (đổi tên file nếu khác)
COPY ch09_ex1_download_war.war "$CATALINA_HOME/webapps/ROOT.war"

# Entrypoint: map cổng Tomcat = $PORT (Render cung cấp)
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Mặc định Tomcat dùng 8080 (khi chạy local)
EXPOSE 8080

CMD ["/usr/local/bin/docker-entrypoint.sh"]

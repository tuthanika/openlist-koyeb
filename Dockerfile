FROM openlistteam/openlist:latest-lite-aria2

# Chạy bằng root để có quyền ghi vào /opt/openlist/data khi không có volume
USER 0:0

# Tạo thư mục dữ liệu và mở quyền ghi/execute
RUN mkdir -p /opt/openlist/data && chmod -R 0777 /opt/openlist/data

VOLUME /opt/openlist/data/
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]
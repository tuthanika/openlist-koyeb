FROM openlistteam/openlist:latest-lite-aria2
USER openlist

WORKDIR /opt/openlist/

# Ghi đè entrypoint.sh bằng bản đã sửa
COPY entrypoint.sh /entrypoint.sh

VOLUME /opt/openlist/data/
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]

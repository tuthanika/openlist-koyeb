FROM tuthanika/openlist:latest-lite-aria2

WORKDIR /opt/openlist/

# Ghi đè entrypoint.sh nếu cần
COPY --chmod=755 entrypoint.sh /entrypoint.sh

VOLUME /opt/openlist/data/
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]
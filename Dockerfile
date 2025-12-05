FROM openlistteam/openlist:latest-lite-aria2

USER root
RUN mkdir -p /opt/openlist/data && chmod 777 /opt/openlist/data

USER openlist
WORKDIR /opt/openlist/data
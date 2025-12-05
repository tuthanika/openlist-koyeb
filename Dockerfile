FROM openlistteam/openlist:latest-lite-aria2

WORKDIR /opt/openlist/data


VOLUME /opt/openlist/data/
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]
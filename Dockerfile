FROM openlistteam/openlist:latest-lite-aria2

USER root
WORKDIR /opt/openlist/data
USER openlist
VOLUME /opt/openlist/data/
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]

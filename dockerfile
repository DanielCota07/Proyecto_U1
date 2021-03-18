FROM debian:latest
COPY ./Proyecto.sh /
ENTRYPOINT ["/Proyecto.sh"]

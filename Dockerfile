# FROM openjdk

# COPY . /opt/project
# WORKDIR /opt/project
# EXPOSE 8080

# ENTRYPOINT [ "/opt/project/entrypoint.sh" ]


# Dockerfile focused on production use case
# Builder stage needs JDK and gradle
FROM openjdk:8-jdk-alpine
LABEL author="Hitesh Narendra Dhruna <hitesh@dhruna.com>"
ARG UID=1001
ARG GID=1001

USER root
RUN apk add --no-cache shadow sudo curl && \    
    if [ -z "$(getent group "$GID")" ]; then \
    addgroup -S -g "$GID" relay42; \
    else \
    groupmod -n relay42 "$(getent group "$GID" | cut -d: -f1)"; \
    fi && \
    if [ -z "$(getent passwd "$UID")" ]; then \
    adduser -S -u "$UID" -G relay42 -s /bin/sh relay42; \
    else \
    usermod -l relay42 -g "$GID" -d /home/relay42 -m "$(getent passwd "$UID" | cut -d: -f1)"; \
    fi

WORKDIR /home/relay42/app
COPY . .


# COPY docker-entrypoint.sh /home/relay42/app/docker-entrypoint.sh
# VOLUME /home/relay42/app/.config
# COPY application.yml /home/relay42/app/.config/
RUN mkdir /files && \
    chown relay42:relay42 -R /home/relay42/app /files
USER relay42
ARG date_api_host
ARG date_api_port
ENV date_api_host=${date_api_host} date_api_port=${date_api_port}
ENTRYPOINT [ "sh", "/home/relay42/app/docker-entrypoint.sh" ]
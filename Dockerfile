FROM hypriot/rpi-alpine:3.6

MAINTAINER Andreas Mahnke <mahnkong@gmx.de>

ENV RCLONE_VERSION v1.38

RUN apk update \
    && apk upgrade \
    && apk add wget unzip \
    && wget --no-check-certificate http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-arm.zip \
    && unzip rclone-${RCLONE_VERSION}-linux-arm.zip \
    && cp ./rclone-${RCLONE_VERSION}-linux-arm/rclone /usr/sbin \
    && chown root:root /usr/sbin/rclone \
    && chmod 755 /usr/sbin/rclone \
    && rm -rf /var/cache/apk/* \
    && rm -rf /rclone-${RCLONE_VERSION}-*

ENTRYPOINT ["rclone"]


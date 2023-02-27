#
# Nasqueron - Notifications image
#

FROM nasqueron/nginx-php-fpm:novolume
MAINTAINER Nasqueron Organisation <docker@nasqueron.org>

#
# Prepare the container
#

COPY files /

WORKDIR /var/wwwroot/default

RUN git clone https://github.com/nasqueron/notifications.git . && \
    composer install --ignore-platform-reqs --no-dev -o && \
    chown -R app:app /var/wwwroot/default

#
# Run the container
#

CMD ["/usr/local/sbin/init-container"]

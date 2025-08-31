# vim: sw=2 ts=2 et

# Start with the linuxserver bookstack container
FROM lscr.io/linuxserver/bookstack:amd64-25.07.2

# Copy static files into the container:
#  * The periodic script (runs daily) to do a Certbot renewal
COPY root/ /

# Do all of our work
RUN \
  echo '**** install certbot ****' && \
  apk add certbot && \
  echo '**** make symlinks ****' && \
  ln -s /config/log/letsencrypt /var/log/letsencrypt && \
  ln -s /config/letsencrypt /etc/letsencrypt && \
  echo '**** make scripts executable ****' && \
  chmod a+x \
  /etc/periodic/daily/certbot \
  /etc/s6-overlay/s6-rc.d/init-certbot-config/run \
  && \
  echo '**** complete! ****'

# All done!

FROM alpine:latest

ARG NON_ROOT_USER=novnc

# Install noVNC and supervisor
RUN apk upgrade --no-cache
RUN apk add --no-cache \
  novnc \
  supervisor

# Redirect webroot to vnc.html instead of displaying directory listing
RUN echo "<!DOCTYPE html><html><head><meta http-equiv=\"Refresh\" content=\"0; url='vnc.html'\" /></head><body></body></html>" > /usr/share/novnc/index.html

# Copy the supervisord config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create a non-root user
RUN addgroup -S $NON_ROOT_USER && adduser -S $NON_ROOT_USER -G $NON_ROOT_USER

# Create app directory owned by the non-root user
RUN mkdir /app
RUN chown $NON_ROOT_USER:$NON_ROOT_USER /app
WORKDIR /app

USER $NON_ROOT_USER

EXPOSE 8080

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]


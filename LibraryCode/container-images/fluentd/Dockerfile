FROM fluent/fluentd:v1.1-debian

USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

RUN buildDeps="sudo make gcc g++ libc-dev ruby-dev libffi-dev patch curl" \
     && apt-get update \
     && apt-get install \
     -y --no-install-recommends \
     $buildDeps \
    && echo 'gem: --no-document' >> /etc/gemrc \
    && gem install ffi \
    && fluent-gem install fluent-plugin-secure-forward \
    && fluent-gem install fluent-plugin-record-reformer \
    && fluent-gem install fluent-plugin-elasticsearch \
    && fluent-gem install fluent-plugin-kubernetes_metadata_filter \
    && fluent-gem install fluent-plugin-systemd \
    && fluent-gem install fluent-plugin-prometheus \
    && fluent-gem install fluent-plugin-rewrite-tag-filter fluent-plugin-aws-elasticsearch-service fluent-plugin-forest \
    && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Copy configuration files
COPY fluent.conf /fluentd/etc/

# Copy plugins
COPY plugins /fluentd/plugins/

COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# Run Fluentd
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT

FROM dockerfile/java:oracle-java8
MAINTAINER Christopher J Lyth <cjlyth@gmail.com>

ENV PRODUCT_VERSION 1.4.4
ENV PRODUCT_NAME elasticsearch
ENV PRODUCT_HOME /opt/$PRODUCT_NAME-$PRODUCT_VERSION

ENV PRODUCT_MIRROR https://download.elasticsearch.org/elasticsearch/elasticsearch
ENV PRODUCT_BIN_URL $PRODUCT_MIRROR/$PRODUCT_NAME-$PRODUCT_VERSION.tar.gz
ENV PRODUCT_SIG_URL $PRODUCT_BIN_URL.sha1.txt

COPY entrypoint.sh /

# # sha256sum
RUN mkdir -p  $PRODUCT_HOME                             \
 && curl -sSL $PRODUCT_BIN_URL -o $PRODUCT_NAME.tar.gz  \
 && tar  -xf  $PRODUCT_NAME.tar.gz                      \
         -C   $PRODUCT_HOME                             \
         --strip-components=1                           \
         --exclude="examples"                           \
         --exclude="docs"                               \
 && rm -f $PRODUCT_NAME.tar.gz                          \
 && chmod +x /entrypoint.sh                             \
 && ln -s    /entrypoint.sh                             \
             /usr/local/bin/elasticsearch               \
 && ln -s    $PRODUCT_HOME/bin/plugin                   \
             /usr/local/bin/

RUN plugin -i mobz/elasticsearch-head                             \
 && plugin -i elasticsearch/marvel/latest                         \
 && plugin -i elasticsearch/elasticsearch-analysis-kuromoji/2.4.2 

EXPOSE 9200 9300

ENV PATH $PATH:$PRODUCT_HOME/bin
ENTRYPOINT ["/entrypoint.sh"]
CMD ["elasticsearch"]

#sysctl -w vm.max_map_count=262144
